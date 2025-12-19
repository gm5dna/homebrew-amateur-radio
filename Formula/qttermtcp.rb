class Qttermtcp < Formula
  desc "Terminal application for packet radio"
  homepage "https://github.com/g8bpq/QtTermTCP"
  url "https://github.com/g8bpq/QtTermTCP/archive/refs/tags/0.79.tar.gz"
  sha256 "d0a0b8cac93ae1b7e6690f4ec90db147054779a82bfc3cb561cd0121b037a267"
  license "GPL-3.0-or-later"

  depends_on "qt@5"

  def install
    system "qmake", "QtTermTCP.pro"
    system "make"
    prefix.install "QtTermTCP.app"
  end

  def caveats
    <<~EOS
      The application has been installed as a macOS app bundle in:
        #{opt_prefix}/QtTermTCP.app

      You can link it to /Applications with:
        ln -s #{opt_prefix}/QtTermTCP.app /Applications/QtTermTCP.app
    EOS
  end

  test do
    assert_path_exists prefix/"QtTermTCP.app"
  end
end
