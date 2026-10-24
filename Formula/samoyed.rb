class Samoyed < Formula
  desc "Software modem/TNC for packet radio (Go port of Dire Wolf)"
  homepage "https://github.com/doismellburning/samoyed"
  url "https://github.com/doismellburning/samoyed.git",
      tag:      "2026.10.23.1792794998-f3d1a55",
      revision: "f3d1a55d9caafe1170a36dffc36f8166d2a56289"
  version "2026.10.23.1792794998"
  license "GPL-2.0-or-later"
  head "https://github.com/doismellburning/samoyed.git", branch: "main"

  livecheck do
    url :stable
    strategy :git
    regex(/^(\d{4}\.\d{2}\.\d{2}\.\d+)-\h+$/i)
  end

  depends_on "go" => :build
  depends_on "pkgconf" => :build
  depends_on "hamlib"
  depends_on "portaudio"

  def install
    ldflags = "-X github.com/doismellburning/samoyed/src.SAMOYED_VERSION=#{version}"
    Dir["cmd/*"].each do |cmd|
      name = File.basename(cmd)
      system "go", "build", *std_go_args(output: bin/name, ldflags: ldflags), "./cmd/#{name}/"
    end
    man1.install Dir["man/*.1"]
  end

  test do
    assert_match "APRS encoder/decoder", shell_output("#{bin}/samoyed-direwolf --help 2>&1")
  end
end
