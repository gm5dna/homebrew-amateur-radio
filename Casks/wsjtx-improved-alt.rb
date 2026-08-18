cask "wsjtx-improved-alt" do
  version "3.2.0,260818"

  on_arm do
    sha256 "0ee7503200eed9265cf55a24bc0fe74b7ebf673103dc5117fa3af2d3835191e6"

    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}_improved_AL_PLUS_#{version.csv.second}_ARM.zip"
  end
  on_intel do
    sha256 "8aa8e87f8116a27590d7f00ae221cb8ad45813aa2197dcd43be1059c40a47222"

    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}_improved_AL_PLUS_#{version.csv.second}_Darwin.dmg"
  end

  name "WSJT-X Improved (Alt Layout)"
  desc "Improved version of WSJT-X (alternative layout)"
  homepage "https://sourceforge.net/projects/wsjt-x-improved/"

  livecheck do
    # Project-wide feed (the ~100 most recent files) so new WSJT-X_v<version>
    # directories are picked up automatically; the regex narrows the matches
    # to this variant's macOS ARM artefact.
    url "https://sourceforge.net/projects/wsjt-x-improved/rss?path=/"
    regex(%r{/wsjtx[._-]v?(\d+(?:\.\d+)+)[._-]improved[._-]AL[._-]PLUS[._-](\d+(?:-\w+)?)[._-]ARM}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0]},#{match[1]}" }
    end
  end

  depends_on macos: :big_sur

  app "wsjtx.app", target: "wsjtx-improved-alt.app"

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
