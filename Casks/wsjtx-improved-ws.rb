cask "wsjtx-improved-ws" do
  version "3.1.0,260522"

  on_arm do
    sha256 "62991461110086e0c83a7a305ec0aa213b626e4357e680ffdb5b5b5e1e6b75ff"

    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}_improved_widescreen_PLUS_#{version.csv.second}_ARM.zip"
  end
  on_intel do
    sha256 "babfd67e41c7b7e4bbb22c2ee124ab07eb52e634f7d3e2f03ff5ecf45e73efae"

    # Upstream typo: the widescreen Darwin DMG is published as "26052" (missing
    # the final digit of the 260522 build date); the correctly-named file 404s.
    # TODO(2026-05-22): restore #{version.csv.second} interpolation once upstream
    # corrects the filename — until then the Intel build number is intentionally
    # decoupled from `version` and the livecheck only tracks the ARM artefact.
    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}_improved_widescreen_PLUS_26052_Darwin.dmg"
  end

  name "WSJT-X Improved (Widescreen)"
  desc "Improved version of WSJT-X (widescreen layout)"
  homepage "https://sourceforge.net/projects/wsjt-x-improved/"

  livecheck do
    # Project-wide feed (the ~100 most recent files) so new WSJT-X_v<version>
    # directories are picked up automatically; the regex narrows the matches
    # to this variant's macOS ARM artefact.
    url "https://sourceforge.net/projects/wsjt-x-improved/rss?path=/"
    regex(%r{/wsjtx[._-]v?(\d+(?:\.\d+)+)[._-]improved[._-]widescreen[._-]PLUS[._-](\d+(?:-\w+)?)[._-]ARM}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0]},#{match[1]}" }
    end
  end

  depends_on macos: :big_sur

  app "wsjtx.app", target: "wsjtx-improved-ws.app"

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
