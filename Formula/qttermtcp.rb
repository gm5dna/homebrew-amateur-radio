class Qttermtcp < Formula
  desc "Terminal application for packet radio"
  homepage "https://github.com/gm5dna/QtTermTCP"
  url "https://github.com/gm5dna/QtTermTCP/archive/refs/heads/master.tar.gz"
  version "0.79"
  sha256 "132e36af74efc09505486b6a2ec1e56d2aa38722b23382a64d5cc94dce996cc4"
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

      To link it to /Applications (requires sudo):
        sudo ln -s #{opt_prefix}/QtTermTCP.app /Applications/QtTermTCP.app

      Or to copy it to /Applications instead:
        cp -r #{opt_prefix}/QtTermTCP.app /Applications/
    EOS
  end

  test do
    assert_path_exists prefix/"QtTermTCP.app"
  end
end
