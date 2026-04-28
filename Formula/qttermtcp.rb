class Qttermtcp < Formula
  desc "Terminal application for packet radio"
  homepage "https://github.com/g8bpq/QtTermTCP"
  # Pinned to a specific commit because upstream's tags lag the embedded
  # version in master. Bump the URL + sha256 + version when reviewing.
  url "https://github.com/g8bpq/QtTermTCP/archive/00ca15573c4653882265d6bfc884fca619556c30.tar.gz"
  version "0.81"
  sha256 "5bdc377e6de7e900a14087e39fef146ed3bd47879c06744245f6d54d90517488"
  license "GPL-3.0-or-later"

  livecheck do
    skip "No tagged releases available"
  end

  depends_on "qt@5"

  # Apply g8bpq/QtTermTCP#1 (gm5dna): regenerated .icns that actually renders on
  # macOS, and the qmake variable fix (ICONS -> ICON) needed for the icon to be
  # picked up. The PR is unmerged upstream, so we carry it inline.
  resource "icns" do
    url "https://raw.githubusercontent.com/gm5dna/QtTermTCP/756001d2ee1c7a48a45f31855ea631644683251b/QtTermTCP.icns"
    sha256 "4c209b1c725f30540bbc252571244f01410482f78868e3b5c8d3077f6de5a746"
  end

  def install
    ENV["QMAKE_MACOSX_DEPLOYMENT_TARGET"] = MacOS.version.to_s
    # Upstream ships build artefacts (stale .qmake.stash, Makefile, *.o, and a
    # prebuilt QtTermTCP.app skeleton with an empty CFBundleIconFile) in the
    # master tarball. Remove them so qmake regenerates against the current SDK
    # and writes a fresh Info.plist with the ICON value populated.
    rm(".qmake.stash")
    rm("Makefile")
    Dir.glob("*.o").each { |f| rm(f) }
    rm_r("QtTermTCP.app")

    # g8bpq/QtTermTCP#1: replace icns and fix qmake variable name.
    resource("icns").stage { cp "QtTermTCP.icns", buildpath/"QtTermTCP.icns" }
    inreplace "QtTermTCP.pro", "ICONS = QtTermTCP.icns", "ICON = QtTermTCP.icns"

    system Formula["qt@5"].opt_bin/"qmake", "CONFIG+=sdk_no_version_check", "QtTermTCP.pro"
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
