cask "multimode" do
  version "6.9.0"
  sha256 :no_check

  url "https://www.blackcatsystems.com/download/MultiModeOSX.dmg",
      user_agent: :fake
  name "MultiMode"
  desc "Decoder for CW, RTTY, FAX, SSTV, NAVTEX, PSK31 and other digital modes"
  homepage "https://www.blackcatsystems.com/software/multimode.html"

  livecheck do
    url :homepage
    regex(/MultiModeOSX\s+Version\s+(\d+(?:\.\d+)+)/i)
  end

  depends_on :macos

  app "MultiMode Cocoa.app"

  zap trash: [
    "~/Library/Application Support/MultiMode Cocoa",
    "~/Library/Preferences/com.blackcatsystems.multimode.plist",
    "~/Library/Saved Application State/com.blackcatsystems.multimode.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
