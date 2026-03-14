cask "wsjtx" do
  version "2.7.0"
  sha256 "f3ef11f3612f1db7bcdea55e5a4ce409b0c1db43ae6bc1a5e048fc99833e031e"

  url "https://downloads.sourceforge.net/wsjt/wsjtx-#{version}/wsjtx-#{version}-Darwin.dmg",
      verified: "downloads.sourceforge.net/wsjt/"
  name "WSJT-X"
  desc "Weak-signal digital communication using FT8, FT4, JT65, and WSPR modes"
  homepage "https://physics.princeton.edu/pulsar/k1jt/wsjtx.html"

  livecheck do
    url "https://sourceforge.net/projects/wsjt/files/wsjtx/"
    regex(%r{href=.*?/wsjtx[._-]v?(\d+(?:\.\d+)+)/?["' >]}i)
    strategy :page_match
  end

  app "wsjtx.app"

  zap trash: [
    "~/Library/Application Support/WSJT-X",
    "~/Library/Preferences/org.wsjtx.WSJTX.plist",
    "~/Library/Saved Application State/org.wsjtx.WSJTX.savedState",
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
