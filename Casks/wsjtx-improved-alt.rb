cask "wsjtx-improved-alt" do
  version "3.1.0,260228"
  sha256 :no_check

  on_arm do
    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}_improved_AL_PLUS_#{version.csv.second}_M1.zip"
  end
  on_intel do
    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v3.1.0/macOS/wsjtx-3.1.0_improved_AL_PLUS_260226-OFC-Darwin.dmg"
  end

  name "WSJT-X Improved (Alt Layout)"
  desc "Improved version of WSJT-X (alternative layout)"
  homepage "https://sourceforge.net/projects/wsjt-x-improved/"

  livecheck do
    url "https://sourceforge.net/projects/wsjt-x-improved/rss?path=/WSJT-X_v3.1.0/macOS"
    regex(%r{/wsjtx[._-]v?(\d+(?:\.\d+)+)[._-]improved[._-]AL[._-]PLUS[._-](\d+(?:-\w+)?)[._-]M1}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0]},#{match[1]}" }
    end
  end

  depends_on macos: ">= :monterey"

  app "wsjtx.app", target: "wsjtx-improved-alt.app"

  zap trash: [
    "~/Library/Application Support/WSJT-X",
    "~/Library/Preferences/wsjtx.plist",
    "~/Library/Saved Application State/wsjtx.savedState",
  ]
end
