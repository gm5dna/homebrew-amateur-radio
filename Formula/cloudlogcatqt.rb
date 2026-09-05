class Cloudlogcatqt < Formula
  desc "CAT control interface for Cloudlog amateur radio logging"
  homepage "https://github.com/myzinsky/CloudLogCatQt"
  # Upstream publishes no tags/releases or version number, so pin to a specific
  # commit with a placeholder version. Bump the URL, sha256 and version together
  # when reviewing.
  url "https://github.com/myzinsky/CloudLogCatQt/archive/c067920158675c40d180d9139043c37d28d5cb9b.tar.gz"
  version "0.0.1"
  sha256 "3f3ef375424348d564887018e67f9222d33ac762feadd2f74de400984e45649f"
  license "GPL-3.0-or-later"
  head "https://github.com/myzinsky/CloudLogCatQt.git", branch: "master"

  livecheck do
    skip "No versioned releases"
  end

  depends_on "qt@5"

  def install
    # CONFIG+=sdk_no_version_check silences the SDK version warning
    system formula_opt_bin("qt@5")/"qmake", "CONFIG+=sdk_no_version_check", "CloudLogCatQt.pro"
    system "make"

    # The build creates CloudLogCatQt.app bundle
    prefix.install "CloudLogCatQt.app"
  end

  def caveats
    <<~EOS
      CloudLogCatQt is installed at:
        #{opt_prefix}/CloudLogCatQt.app
      To show it in Finder and Launchpad, link it into /Applications:
        ln -s #{opt_prefix}/CloudLogCatQt.app /Applications/CloudLogCatQt.app

      To use it, configure your Cloudlog instance URL and API key in the app.
      The app connects to FlRig for radio CAT control.

      See https://github.com/myzinsky/CloudLogCatQt for documentation.
    EOS
  end

  test do
    assert_predicate prefix/"CloudLogCatQt.app/Contents/MacOS/CloudLogCatQt", :executable?
  end
end
