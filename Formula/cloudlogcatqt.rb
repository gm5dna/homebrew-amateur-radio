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
    # Silence SDK version warning
    ENV["QMAKE_MACOSX_DEPLOYMENT_TARGET"] = MacOS.version.to_s
    system Formula["qt@5"].opt_bin/"qmake", "CONFIG+=sdk_no_version_check", "CloudLogCatQt.pro"
    system "make"

    # The build creates CloudLogCatQt.app bundle
    prefix.install "CloudLogCatQt.app"
  end

  def post_install
    # Symlink into /Applications so it appears in Finder/Launchpad.
    # Only ever manage a symlink we created; never remove a real app
    # the user already installed there.
    applications_app = Pathname("/Applications/CloudLogCatQt.app")
    applications_app.unlink if applications_app.symlink?
    ln_s opt_prefix/"CloudLogCatQt.app", applications_app unless applications_app.exist?
  rescue Errno::EPERM
    opoo "Could not symlink to /Applications (permission denied)."
    opoo "Run: sudo ln -s #{opt_prefix}/CloudLogCatQt.app /Applications/CloudLogCatQt.app"
  end

  def caveats
    <<~EOS
      CloudLogCatQt is installed at:
        #{opt_prefix}/CloudLogCatQt.app
      and symlinked to /Applications/CloudLogCatQt.app when that location is
      writable and no app of that name already exists there.

      To use it, configure your Cloudlog instance URL and API key in the app.
      The app connects to FlRig for radio CAT control.

      See https://github.com/myzinsky/CloudLogCatQt for documentation.
    EOS
  end

  test do
    assert_predicate prefix/"CloudLogCatQt.app/Contents/MacOS/CloudLogCatQt", :executable?
  end
end
