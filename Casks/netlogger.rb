cask "netlogger" do
  version "3.1.7"
  sha256 "7b85c541dbd554807dd0fca37f5c83d890a6db6e60cbff1e0f706e07baa649a2"

  url "https://www.netlogger.org/downloads/NetLogger_#{version}_MacOSX_x64.dmg"
  name "NetLogger"
  desc "Amateur radio net logging and real-time net monitoring"
  homepage "https://www.netlogger.org/"

  livecheck do
    url "https://netlogger.org/download.php"
    regex(/NetLogger[._-]v?(\d+(?:\.\d+)+)[._-]MacOSX/i)
    strategy :page_match
  end

  depends_on :macos

  app "NetLogger.app"

  zap trash: [
    "~/Library/Preferences/org.netlogger.NetLogger.plist",
    "~/Library/Saved Application State/org.netlogger.NetLogger.savedState",
  ]
end
