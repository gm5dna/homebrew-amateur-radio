class Linbpq < Formula
  desc "G8BPQ AX.25 packet switch (Linux/macOS port of BPQ32)"
  homepage "https://github.com/g8bpq/linbpq"
  # Upstream has no tags or releases; pin to a specific commit. Bump the URL,
  # sha256 and version together when reviewing — the version is taken from
  # KVerstring in Versions.h.
  url "https://github.com/g8bpq/linbpq/archive/e40d3647752f8c7ccdae668293874b4e7075146b.tar.gz"
  version "6.0.25.35"
  sha256 "335fc0297c74d6dfb50795d4ea5fce81018f8f50356b2f656860d8c81c517865"
  license :cannot_represent

  livecheck do
    skip "No tagged releases available"
  end

  depends_on "libconfig"
  depends_on "miniupnpc"

  def install
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
