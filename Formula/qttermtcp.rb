class Qttermtcp < Formula
  desc "QtTermTCP terminal application"
  homepage "https://github.com/g8bpq/QtTermTCP"
  url "https://github.com/g8bpq/QtTermTCP/archive/refs/tags/0.79.zip"
  version "0.0.0.79"
  sha256 "c01e5ea266833d47469c7aa0d9f7ac582767de771960aaed57d07fd915de6237"
  license "GPL-3.0-or-later"

  depends_on "qt5"

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
    assert_predicate prefix/"QtTermTCP.app", :exist?, "QtTermTCP.app bundle was not installed"
  end
end