cask "wsjtx" do
  on_arm do
    version "3.0.0"
    sha256 "f9d95aad28e4da29b6f1d1fdf75647ecffe68162f3edc9e13d1984645bb21a37"

    url "https://downloads.sourceforge.net/wsjt/wsjtx-#{version}/wsjtx-#{version}-ARM-Darwin.dmg",
        verified: "downloads.sourceforge.net/wsjt/"
  end
  on_intel do
    version "3.0.1"
    sha256 "faf71d2681eb9a266ad7219d30ad7d5520a0f6e3158da7906444bcdeb4a13436"

    url "https://downloads.sourceforge.net/wsjt/wsjtx-#{version}/wsjtx-#{version}-Darwin.dmg",
        verified: "downloads.sourceforge.net/wsjt/"
  end

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
