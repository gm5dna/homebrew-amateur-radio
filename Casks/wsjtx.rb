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

  uninstall quit:    "org.k1jt.wsjtx",
            pkgutil: "org.k1jt.wsjtx.*"

  zap trash: [
    "~/Library/Application Support/WSJT-X",
    "~/Library/Preferences/org.k1jt.wsjtx.plist",
    "~/Library/Saved Application State/org.k1jt.wsjtx.savedState",
  ]

  caveats <<~EOS
    WSJT-X requires increased shared memory limits on macOS.
    If you see a "shared memory" error, create the file
    /Library/LaunchDaemons/com.wsjtx.sysctl.plist with:

      sudo tee /Library/LaunchDaemons/com.wsjtx.sysctl.plist << 'PLIST'
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
          <key>Label</key>
          <string>com.wsjtx.sysctl</string>
          <key>Program</key>
          <string>/usr/sbin/sysctl</string>
          <key>ProgramArguments</key>
          <array>
              <string>/usr/sbin/sysctl</string>
              <string>kern.sysv.shmmax=52428800</string>
              <string>kern.sysv.shmall=25600</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
      </dict>
      </plist>
      PLIST
      sudo chown root:wheel /Library/LaunchDaemons/com.wsjtx.sysctl.plist

    Then restart your Mac for the changes to take effect.
  EOS
end
