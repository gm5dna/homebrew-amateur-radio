cask "mininec-pro" do
  version "2.1.0"
  sha256 :no_check

  url "https://www.blackcatsystems.com/download/MININECProOSX.dmg",
      user_agent: :fake
  name "MININEC Pro"
  desc "Antenna analysis and modelling using the MININEC engine"
  homepage "https://www.blackcatsystems.com/software/mininec-antenna-analysis-modeling-software.html"

  livecheck do
    url :homepage
    regex(/MININEC Pro\s+(\d+(?:\.\d+)+)\s+for/i)
  end

  depends_on :macos

  app "MININEC Pro.app"

  zap trash: [
    "~/Library/Application Support/MININEC Pro",
    "~/Library/Preferences/com.blackcatsystems.MININEC.plist",
    "~/Library/Saved Application State/com.blackcatsystems.MININEC.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
