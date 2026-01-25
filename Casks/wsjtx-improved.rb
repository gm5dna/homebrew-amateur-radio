cask "wsjtx-improved" do
  version "3.0.0,251212"
  sha256 :no_check

  on_arm do
    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}_improved_PLUS_#{version.csv.second}_M1.zip"
  end
  on_intel do
    url "https://downloads.sourceforge.net/wsjt-x-improved/WSJT-X_v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}_improved_PLUS_#{version.csv.second}_Darwin.zip"
  end

  name "WSJT-X Improved"
  desc "Enhanced and experimental builds of WSJT-X for amateur radio digital modes"
  homepage "https://sourceforge.net/projects/wsjt-x-improved/"

  livecheck do
    url "https://sourceforge.net/projects/wsjt-x-improved/rss?path=/WSJT-X_v3.0.0/macOS"
    regex(%r{/wsjtx[._-]v?(\d+(?:\.\d+)+)[._-]improved[._-]PLUS[._-](\d+)}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0]},#{match[1]}" }
    end
  end

  depends_on macos: ">= :monterey"

  app "wsjtx.app", target: "wsjtx-improved.app"

  zap trash: [
    "~/Library/Application Support/WSJT-X",
    "~/Library/Preferences/wsjtx.plist",
    "~/Library/Saved Application State/wsjtx.savedState",
  ]
end
