#!/usr/bin/env bash
#
# Verify every cask's sha256 against GitHub's recorded release-asset digest,
# for BOTH architectures, without downloading a byte.
#
# Why this exists: `brew fetch --cask` only downloads the artifact for the
# architecture it is running on. On an Apple Silicon machine (and on the
# arm64 CI runners) an `on_intel` sha256 is never validated, so a wrong one
# passes every local check. That is exactly how a bogus Intel sha256 for
# `sdr-angel` reached main. GitHub publishes `sha256:...` in each release
# asset's `digest` field, which lets us check both arches from any host.
#
# It also catches upstream silently replacing an asset in place under an
# unchanged tag (dl1bz/deskhpsdr did this to 2.7.19), which livecheck cannot
# see because the version never changes.
#
# Exit 1 on any mismatch. Assets we cannot verify this way are reported
# explicitly rather than passed over in silence.
#
# Pass --full (or VERIFY_FULL=1) to additionally download and hash every
# artifact that has a sha256 but is not a digest-bearing GitHub release asset
# (SourceForge, S3, plain web hosts). That closes the gap for their Intel
# builds too, at the cost of a couple of GB, so CI runs it on the daily
# schedule rather than on every push.
#
# Requires: brew (with this tap available), gh (authenticated via GH_TOKEN).
# Written for bash 3.2 (macOS /bin/bash): no associative arrays.

set -uo pipefail

full=0
case "${1:-}" in
  --full) full=1 ;;
  "") [ "${VERIFY_FULL:-0}" = "1" ] && full=1 ;;
  *) echo "usage: $(basename "$0") [--full]" >&2; exit 2 ;;
esac

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$repo_root" || exit 1

work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
rows="$work/rows.tsv"
cache="$work/cache"
mkdir -p "$cache"

if ! brew ruby .github/scripts/dump-cask-artifacts.rb > "$rows"; then
  echo "::error::failed to load one or more casks; see errors above"
  exit 1
fi
[ -s "$rows" ] || { echo "::error::cask dump produced no rows"; exit 1; }

# Collapse rows resolving to the same artifact (universal binaries, and
# arm64-only casks whose simulated-intel row is identical).
dedup="$work/dedup.tsv"
awk -F'\t' '!seen[$3 "|" $4]++' "$rows" > "$dedup"

# GitHub release-asset URL: /<owner>/<repo>/releases/download/<tag>/<asset>
gh_asset_re='^https://github\.com/([^/]+)/([^/]+)/releases/download/([^/]+)/(.+)$'

mismatches=0 verified=0
skipped_no_check=0 skipped_not_gh=0 skipped_no_digest=0
skip_log="" mismatch_log=""

while IFS=$'\t' read -r token arch url sha; do
  [ -n "${url:-}" ] || continue

  if [ "$sha" = "no_check" ]; then
    skipped_no_check=$((skipped_no_check + 1))
    skip_log+="  no_check    ${token} (${arch})  ${url}"$'\n'
    continue
  fi

  if [[ ! "$url" =~ $gh_asset_re ]]; then
    skipped_not_gh=$((skipped_not_gh + 1))
    skip_log+="  not-github  ${token} (${arch})  ${url}"$'\n'
    printf '%s\t%s\t%s\t%s\n' "$token" "$arch" "$url" "$sha" >> "$work/todo.tsv"
    continue
  fi

  owner="${BASH_REMATCH[1]}"; repo="${BASH_REMATCH[2]}"
  tag="${BASH_REMATCH[3]}";   asset="${BASH_REMATCH[4]}"

  cache_file="$cache/$(printf '%s' "${owner}/${repo}@${tag}" | shasum -a 256 | cut -d' ' -f1)"
  if [ ! -f "$cache_file" ]; then
    if ! gh api "repos/${owner}/${repo}/releases/tags/${tag}" \
           --jq '.assets[] | "\(.name)\t\(.digest)"' > "$cache_file" 2>/dev/null; then
      echo "::error file=Casks/${token}.rb::${token} (${arch}): cannot read release ${owner}/${repo}@${tag}"
      mismatch_log+="  UNREADABLE RELEASE  ${token} (${arch})  ${owner}/${repo}@${tag}"$'\n'
      mismatches=$((mismatches + 1))
      rm -f "$cache_file"
      continue
    fi
  fi

  digest="$(awk -F'\t' -v a="$asset" '$1 == a { print $2; exit }' "$cache_file")"

  if [ -z "$digest" ]; then
    echo "::error file=Casks/${token}.rb::${token} (${arch}): asset '${asset}' not found in release ${owner}/${repo}@${tag}"
    mismatch_log+="  MISSING ASSET  ${token} (${arch})  ${asset}"$'\n'
    mismatches=$((mismatches + 1))
    continue
  fi

  if [ "$digest" = "null" ]; then
    # Assets uploaded before GitHub recorded digests have none. Not a failure,
    # but say so out loud rather than let a skip look like a pass.
    skipped_no_digest=$((skipped_no_digest + 1))
    skip_log+="  no-digest   ${token} (${arch})  ${asset}"$'\n'
    printf '%s\t%s\t%s\t%s\n' "$token" "$arch" "$url" "$sha" >> "$work/todo.tsv"
    continue
  fi

  actual="${digest#sha256:}"
  if [ "$actual" = "$sha" ]; then
    verified=$((verified + 1))
  else
    echo "::error file=Casks/${token}.rb::sha256 mismatch for ${token} (${arch}): declared ${sha}, upstream ${actual}"
    mismatch_log+="  MISMATCH    ${token} (${arch}) ${asset}"$'\n'
    mismatch_log+="              declared ${sha}"$'\n'
    mismatch_log+="              upstream ${actual}"$'\n'
    mismatches=$((mismatches + 1))
  fi
done < "$dedup"

echo
echo "Verified against GitHub release digests: ${verified}"
echo "Not verifiable this way:"
echo "  sha256 :no_check         ${skipped_no_check}"
echo "  not a GitHub release     ${skipped_not_gh}"
echo "  asset has no digest      ${skipped_no_digest}"

downloaded=0
if [ "$full" = "1" ] && [ -s "$work/todo.tsv" ]; then
  echo
  echo "--full: downloading and hashing $(wc -l < "$work/todo.tsv" | tr -d ' ') remaining artifact(s)"
  echo

  while IFS=$'\t' read -r token arch url sha; do
    blob="$work/blob"
    # --fail rejects non-2xx; curl exits 18 on a truncated body even when the
    # server returned 200, which is how a partial SourceForge/CDN response
    # otherwise masquerades as a checksum mismatch. Retry, then believe it.
    if ! curl --fail --location --silent --show-error \
              --retry 3 --retry-delay 2 --retry-all-errors \
              --max-time 900 --output "$blob" "$url" 2>"$work/curl.err"; then
      rc=$?
      echo "::error file=Casks/${token}.rb::${token} (${arch}): download failed (curl exit ${rc}): $(tr -d '\n' < "$work/curl.err")"
      mismatch_log+="  DOWNLOAD FAILED  ${token} (${arch})  curl exit ${rc}"$'\n'
      mismatches=$((mismatches + 1))
      rm -f "$blob"
      continue
    fi

    actual="$(shasum -a 256 "$blob" | cut -d' ' -f1)"
    bytes="$(wc -c < "$blob" | tr -d ' ')"
    rm -f "$blob"

    if [ "$actual" = "$sha" ]; then
      downloaded=$((downloaded + 1))
      printf '  ok        %-22s %-6s %10s bytes\n' "$token" "$arch" "$bytes"
    else
      echo "::error file=Casks/${token}.rb::sha256 mismatch for ${token} (${arch}): declared ${sha}, downloaded ${actual}"
      mismatch_log+="  MISMATCH    ${token} (${arch}) ${url}"$'\n'
      mismatch_log+="              declared   ${sha}"$'\n'
      mismatch_log+="              downloaded ${actual} (${bytes} bytes)"$'\n'
      mismatches=$((mismatches + 1))
    fi
  done < "$work/todo.tsv"

  echo
  echo "Verified by download: ${downloaded}"
elif [ -n "$skip_log" ]; then
  echo
  echo "Unverified detail (these are NOT checked by this job; use --full):"
  printf '%s' "$skip_log"
fi

# :no_check casks are unverifiable by construction, in every mode.
if [ "$full" = "1" ] && [ "$skipped_no_check" -gt 0 ]; then
  echo
  echo "Still unverifiable (sha256 :no_check, ${skipped_no_check}): unversioned or"
  echo "in-place-updated URLs where a checksum cannot be pinned."
fi

if [ "$mismatches" -gt 0 ]; then
  echo
  echo "FAILED: ${mismatches} checksum problem(s)"
  printf '%s' "$mismatch_log"
  exit 1
fi

echo
echo "OK: no checksum mismatches"
