class Samoyed < Formula
  desc "Software modem/TNC for packet radio (Go port of Dire Wolf)"
  homepage "https://github.com/doismellburning/samoyed"
  license "GPL-2.0-or-later"
  head "https://github.com/doismellburning/samoyed.git", branch: "main"

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
    assert_match "APRS encoder/decoder", shell_output("#{bin}/samoyed-direwolf --help 2>&1", 1)
  end
end
