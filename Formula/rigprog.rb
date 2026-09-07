class Rigprog < Formula
  desc "Memory-channel programmer for Yaesu and Icom transceivers"
  homepage "https://github.com/gm5dna/open-rig-programmer"
  url "https://github.com/gm5dna/open-rig-programmer.git",
      tag:      "v1.4.1",
      revision: "ab2b943fb28f0e0fe4c16cd5cbdac569512532ad"
  license "GPL-3.0-or-later"
  head "https://github.com/gm5dna/open-rig-programmer.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ldflags = "-X github.com/gm5dna/open-rig-programmer/internal/buildinfo.version=v#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/rigprog"
  end

  test do
    assert_match "rigprog v#{version}", shell_output("#{bin}/rigprog --version")
    assert_match "list candidate serial ports", shell_output("#{bin}/rigprog --help")
  end
end
