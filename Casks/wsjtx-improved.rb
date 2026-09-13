cask "wsjtx-improved" do
  on_arm do
    version "3.2.0,260908"
    sha256 "dac1610485da24db18b83bac0a4acceac7842b3b8ff57751c3418f2cceaf37a8"

    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}_improved_PLUS_#{version.csv.second}_ARM.zip"
  end
  # No Intel DMG was published for 260908: Intel stays on the last build that
  # has one. Bump on_intel separately once a newer _Darwin.dmg appears.
  on_intel do
    version "3.2.0,260818"
    sha256 "eb2b895e381dbe78f656364682a0f87811a94a54effcbcd215ae44c6cb831085"

    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}_improved_PLUS_#{version.csv.second}_Darwin.dmg"
  end

  name "WSJT-X Improved"
  desc "Enhanced and experimental builds of WSJT-X for amateur radio digital modes"
  homepage "https://sourceforge.net/projects/wsjt-x-improved/"

  livecheck do
    # Project-wide feed (the ~100 most recent files) so new WSJT-X_v<version>
    # directories are picked up automatically; the regex narrows the matches
    # to this variant's macOS ARM artefact.
    url "https://sourceforge.net/projects/wsjt-x-improved/rss?path=/"
    regex(%r{/wsjtx[._-]v?(\d+(?:\.\d+)+)[._-]improved[._-]PLUS[._-](\d+(?:-\w+)?)[._-]ARM}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0]},#{match[1]}" }
    end
  end

  depends_on macos: :big_sur

  app "wsjtx.app", target: "wsjtx-improved.app"

  # ~/Library/Application Support/WSJT-X is intentionally not zapped: it is
  # shared with the official WSJT-X cask (zap that cask to remove it). The
  # paths below are shared between the wsjtx-improved* variants only.
  zap trash: [
    "~/Library/Preferences/F6VY59P28F.org.ko3f.wsjtx.plist",
    "~/Library/Saved Application State/F6VY59P28F.org.ko3f.wsjtx.savedState",
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
