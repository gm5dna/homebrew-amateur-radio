cask "wsjtx-improved" do
  version "3.1.0,260522"

  on_arm do
    sha256 "4a9cc4ea4fc9c401a4bfc08bae638a9d10d74028cf4d46a3627fb9d24e11cd9b"

    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}_improved_PLUS_#{version.csv.second}_ARM.zip"
  end
  on_intel do
    sha256 "ce6cb1b443a42703ab4ceff9d325c15155485ebe0713033a8d121bf22ca24f0c"

    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}_improved_PLUS_#{version.csv.second}_Darwin.dmg"
  end

  name "WSJT-X Improved"
  desc "Enhanced and experimental builds of WSJT-X for amateur radio digital modes"
  homepage "https://sourceforge.net/projects/wsjt-x-improved/"

  livecheck do
    # Path is scoped to the current version directory (and macOS subdir) so the
    # RSS feed reliably contains the macOS artefacts. Bump the path when upstream
    # publishes a new WSJT-X_v<major> directory.
    url "https://sourceforge.net/projects/wsjt-x-improved/rss?path=/WSJT-X_v3.1.0/macOS"
    regex(%r{/wsjtx[._-]v?(\d+(?:\.\d+)+)[._-]improved[._-]PLUS[._-](\d+(?:-\w+)?)[._-]ARM}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0]},#{match[1]}" }
    end
  end

  depends_on macos: :big_sur

  app "wsjtx.app", target: "wsjtx-improved.app"

  zap trash: [
    "~/Library/Application Support/WSJT-X",
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
