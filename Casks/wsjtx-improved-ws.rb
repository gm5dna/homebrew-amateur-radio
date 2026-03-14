cask "wsjtx-improved-ws" do
  version "3.1.0,260228"
  sha256 :no_check

  on_arm do
    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}_improved_widescreen_PLUS_#{version.csv.second}_M1.zip"
  end
  on_intel do
    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v3.1.0/macOS/wsjtx-3.1.0_improved_widescreen_PLUS_260226-OFC-Darwin.dmg"
  end

  name "WSJT-X Improved (Widescreen)"
  desc "Improved version of WSJT-X (widescreen layout)"
  homepage "https://sourceforge.net/projects/wsjt-x-improved/"

  livecheck do
    url "https://sourceforge.net/projects/wsjt-x-improved/rss?path=/WSJT-X_v3.1.0/macOS"
    regex(%r{/wsjtx[._-]v?(\d+(?:\.\d+)+)[._-]improved[._-]widescreen[._-]PLUS[._-](\d+(?:-\w+)?)[._-]M1}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0]},#{match[1]}" }
    end
  end

  depends_on macos: ">= :monterey"

  app "wsjtx.app", target: "wsjtx-improved-ws.app"

  zap trash: [
    "~/Library/Application Support/WSJT-X",
    "~/Library/Preferences/wsjtx.plist",
    "~/Library/Saved Application State/wsjtx.savedState",
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
