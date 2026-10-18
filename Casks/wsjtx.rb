cask "wsjtx" do
  version "3.0.2"

  on_arm do
    sha256 "1b7eff83de7ded13c75b8e65f1eab75a6143d6ecb94c140e4764933b210b23bb"

    url "https://github.com/WSJTX/wsjtx/releases/download/v#{version}/wsjtx-#{version}-arm64-macOS.pkg"

    pkg "wsjtx-#{version}-arm64-macOS.pkg"
  end
  on_intel do
    sha256 "4eb4e0ff9687d78129f847c7d93e926fd65b8351eebae8c9f62521d6cb72f3f9"

    url "https://github.com/WSJTX/wsjtx/releases/download/v#{version}/wsjtx-#{version}-x86_64-macOS.pkg"

    pkg "wsjtx-#{version}-x86_64-macOS.pkg"
  end

  name "WSJT-X"
  desc "Weak-signal digital communication using FT8, FT4, JT65, and WSPR modes"
  homepage "https://wsjt.sourceforge.io/wsjtx.html"

  livecheck do
    url "https://github.com/WSJTX/wsjtx"
    strategy :github_latest
  end

  depends_on :macos

  # The pkg's postinstall loads com.wsjtx.sysctl and symlinks every tool in
  # /usr/local/wsjtx into /usr/local/bin. pkgutil removes neither, so unload
  # the job and delete only the links that point into /usr/local/wsjtx.
  uninstall launchctl: "com.wsjtx.sysctl",
            quit:      "org.k1jt.wsjtx",
            script:    {
              executable:   "/usr/bin/find",
              args:         ["/usr/local/bin", "-maxdepth", "1", "-type", "l",
                             "-lname", "/usr/local/wsjtx/*", "-delete"],
              sudo:         true,
              must_succeed: false,
            },
            pkgutil:   "org.k1jt.wsjtx.*"

  # ~/Library/Application Support/WSJT-X is deliberately not zapped: it holds
  # the QSO log (wsjtx_log.adi) and ALL.TXT. Nor is ~/Library/Preferences/
  # WSJT-X.ini, which holds the station settings. The wsjtx-improved* casks
  # share both.
  zap trash: [
    "~/Library/Preferences/org.k1jt.wsjtx.plist",
    "~/Library/Saved Application State/org.k1jt.wsjtx.savedState",
  ]

  caveats <<~EOS
    The installer sets the shared memory limits WSJT-X needs, using
    /Library/LaunchDaemons/com.wsjtx.sysctl.plist. Uninstalling removes that
    file; if a wsjtx-improved* cask is still installed, recreate it as that
    cask's caveats describe.
  EOS
end
