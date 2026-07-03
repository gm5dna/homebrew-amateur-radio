cask "dx-toolbox" do
  version "6.4.0"
  sha256 :no_check

  url "https://www.blackcatsystems.com/download/DXToolBoxOSX.zip",
      user_agent: :fake
  name "DX Toolbox"
  desc "Shortwave radio propagation and space-weather forecasting tool"
  homepage "https://www.blackcatsystems.com/software/ham-shortwave-radio-propagation-software.html"

  livecheck do
    url :homepage
    regex(/\(Version\s+(\d+(?:\.\d+)+)\)\s*-\s*64\s*bit/i)
  end

  depends_on :macos

  app "DXToolBoxOSX/DX ToolBox.app"

  zap trash: [
    "~/Library/Application Support/DX ToolBox",
    "~/Library/Preferences/com.blackcatsystems.DXToolBox2.plist",
    "~/Library/Saved Application State/com.blackcatsystems.DXToolBox2.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
