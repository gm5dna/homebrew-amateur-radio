cask "wsjtx-improved-ws" do
  version "3.0.0,251212"
  sha256 :no_check

  on_arm do
    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}_improved_widescreen_PLUS_#{version.csv.second}_M1.zip"
  end
  on_intel do
    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}_improved_widescreen_PLUS_#{version.csv.second}_Darwin.zip"
  end

  name "WSJT-X Improved (Widescreen)"
  desc "Improved version of WSJT-X (widescreen layout)"
  homepage "https://sourceforge.net/projects/wsjt-x-improved/"

  livecheck do
    url :homepage
    strategy :page_match
    regex(/wsjtx[._-]v?(\d+(?:\.\d+)+)[._-]improved/i)
  end

  depends_on macos: ">= :monterey"

  app "wsjtx.app", target: "wsjtx-improved-ws.app"

  zap trash: [
    "~/Library/Application Support/WSJT-X",
    "~/Library/Preferences/wsjtx.plist",
    "~/Library/Saved Application State/wsjtx.savedState",
  ]
end
