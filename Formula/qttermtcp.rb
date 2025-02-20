class Qttermtcp < Formula
  desc "Terminal application for packet radio"
  homepage "https://github.com/g8bpq/QtTermTCP"
  url "https://github.com/g8bpq/QtTermTCP/archive/refs/tags/0.79.tar.gz"
  version "0.0.0.79"
  sha256 "150752aa261cb4049019cf5f92e06650806c703f00f5bea4f47c9ca834d9c2eb"
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
    assert_path_exists prefix/"QtTermTCP.app", :exist?, "QtTermTCP.app bundle was not installed"
  end
end
