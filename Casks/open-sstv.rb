cask "open-sstv" do
  version "0.6.18"
  sha256 "178b4a82a8de7e442942418f82cd0728e102c2084bc9ddbd68f55c86b5e26dbc"

  url "https://github.com/bucknova/Open-SSTV/releases/download/v#{version}/open-sstv-macos-arm64.zip"
  name "Open-SSTV"
  desc "SSTV transceiver with rig control, QSO logbook, and image gallery"
  homepage "https://github.com/bucknova/Open-SSTV"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Open-SSTV.app"

  # ~/Library/Application Support/open_sstv is deliberately not zapped: it
  # holds the QSO logbook (logbook.db).
  zap trash: [
    "~/Library/Caches/open_sstv",
    "~/Library/Logs/open_sstv",
    "~/Library/Preferences/com.bucknova.OpenSSTV.plist",
    "~/Library/Saved Application State/com.bucknova.OpenSSTV.savedState",
  ]

  caveats <<~EOS
    The bundle is ad-hoc signed, not notarised, so Gatekeeper will block it
    on first launch: open the app, dismiss the warning, then choose "Open
    Anyway" in System Settings → Privacy & Security. Alternatively, run:

      xattr -r -d com.apple.quarantine /Applications/Open-SSTV.app

    Upstream provides Apple Silicon builds only; Intel Macs need the pipx
    install described in the project README.
  EOS
end
