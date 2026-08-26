class Linbpq < Formula
  desc "G8BPQ AX.25 packet switch (Linux/macOS port of BPQ32)"
  homepage "https://github.com/g8bpq/linbpq"
  # Upstream has no tags or releases; pin to a specific commit. Bump the URL,
  # sha256 and version together when reviewing — the version is taken from
  # KVerstring in Versions.h.
  url "https://github.com/g8bpq/linbpq/archive/87530633f8527342ecb76779ee3fcddcd74e7c6d.tar.gz"
  version "6.0.25.39"
  sha256 "cd1ebe661938e3da6bf9ddad7fc9992b73a899628625216bc630e78a1894c828"
  license :cannot_represent

  livecheck do
    skip "No tagged releases available"
  end

  depends_on "libconfig"
  depends_on "miniupnpc"

  def install
    # winstdint.h is a bundled Windows <stdint.h> replacement guarded by
    # _STDINT_H, but Apple's stdint.h uses _STDINT_H_, so the guard never
    # fires and its 32-bit typedefs clash with the SDK's (intptr_t, uintptr_t,
    # intmax_t, uintmax_t). Defer to the real header instead.
    # The file has CRLF line endings, hence the \r? in the pattern.
    inreplace "winstdint.h",
              /#ifndef _STDINT_H\r?\n#define _STDINT_H\r?\n/,
              "#include <stdint.h>\n#define _STDINT_H\n#ifndef _STDINT_H\n"

    # Bundled libpng 1.2.x assumes Mac OS Classic when TARGET_OS_MAC is set,
    # pulling <fp.h> which doesn't exist on modern macOS. Force the standard
    # <math.h> path so the bundled png sources compile.
    inreplace "pngconf.h",
              /#  if defined\(MACOS\).*?#  endif/m,
              "#  include <math.h>"

    # The Linux build rule appends `sudo setcap ...` after linking. setcap
    # doesn't exist on macOS and the capabilities aren't needed here.
    inreplace "makefile", /^\tsudo setcap.*$/, ""

    ENV.append "LIBRARY_PATH", HOMEBREW_PREFIX/"lib"
    system "make", "EXTRA_CFLAGS=-DMACBPQ -DNOMQTT -I#{HOMEBREW_PREFIX}/include"

    bin.install "linbpq"
  end

  def caveats
    <<~EOS
      linbpq is a packet-radio node and switch. It needs a bpq32.cfg
      configuration file plus runtime data directories before it will start.
      See https://www.cantab.net/users/john.wiseman/Documents/ for the
      installation guide and example configuration.
    EOS
  end

  test do
    # .scrub: the help text contains a Latin-1 copyright byte that is not
    # valid UTF-8 and would crash assert_match.
    assert_match "G8BPQ AX25 Packet Switch", shell_output("#{bin}/linbpq --help").scrub
  end
end
