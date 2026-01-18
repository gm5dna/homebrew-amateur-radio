cask "rf-toolbox" do
  version "5.2.0"
  sha256 :no_check

  url "https://www.blackcatsystems.com/download/RFToolboxOSX.dmg"
  name "RF Toolbox"
  desc "Antenna design and electronics calculator for amateur radio"
  homepage "https://www.blackcatsystems.com/software/electronics-antenna-design-software.html"

  livecheck do
    url "https://www.blackcatsystems.com/download/rftoolbox.html"
    regex(/version\s*(\d+(?:\.\d+)+)/i)
  end

  app "RF Toolbox.app"

  zap trash: [
    "~/Library/Application Support/RF Toolbox",
    "~/Library/Preferences/com.blackcatsystems.rftoolbox.plist",
    "~/Library/Saved Application State/com.blackcatsystems.rftoolbox.savedState",
  ]
end
