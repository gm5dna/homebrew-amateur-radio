cask "wsjtx-improved" do
  version "2.8.0,250501"
  sha256 :no_check

  on_arm do
    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}_improved_PLUS_#{version.csv.second}_M1.zip",
        verified: "sourceforge.net/projects/wsjt-x-improved/"
  end

  on_intel do
    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}_improved_PLUS_#{version.csv.second}_Darwin.zip",
        verified: "sourceforge.net/projects/wsjt-x-improved/"
  end

  name "WSJT-X Improved"
  desc "Improved version of WSJT-X"
  homepage "https://sourceforge.net/projects/wsjt-x-improved/"

  depends_on macos: ">= :monterey"

  app "wsjtx.app", target: "wsjtx-improved.app"

  zap trash: [
    "~/Library/Application Support/WSJT-X",
    "~/Library/Preferences/wsjtx.plist",
    "~/Library/Saved Application State/wsjtx.savedState",
  ]
end
