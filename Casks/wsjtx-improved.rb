cask "wsjtx-improved" do
  version "2.7.1,250501"

  on_arm do
    sha256 :no_check

    url "https://downloads.sourceforge.net/wsjt-x-improved/wsjtx-v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}_improved_PLUS_#{version.csv.second}_M1.zip"
  end
  on_intel do
    sha256 :no_check

    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}_improved_PLUS_#{version.csv.second}_Darwin.zip"
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
