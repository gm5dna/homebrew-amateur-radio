class Linbpq < Formula
  desc "G8BPQ AX.25 packet switch (Linux/macOS port of BPQ32)"
  homepage "https://github.com/g8bpq/linbpq"
  # Upstream has no tags or releases; pin to a specific commit. Bump the URL,
  # sha256 and version together when reviewing — the version is taken from
  # KVerstring in Versions.h.
  url "https://github.com/g8bpq/linbpq/archive/225fbb17897c4aa54cd35f899383833ab2513d5d.tar.gz"
  version "6.0.25.23"
  sha256 "36aad99d278e27818b871df12b001c283d978c760d7c468ecc573739f308e477"
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
    output = shell_output("#{bin}/linbpq --help | head -1")
    assert_match "G8BPQ AX25 Packet Switch", output
  end
end
