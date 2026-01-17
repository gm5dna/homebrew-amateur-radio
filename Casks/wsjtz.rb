cask "wsjtz" do
  version "2.6.1-1.3.3"
  sha256 "0a317721710aa83ac4d3dc602bbfbf40540024c586802a6aba572f3758fe1127"

  url "https://downloads.sourceforge.net/wsjt-z/wsjtz-#{version}-Darwin.dmg",
      verified: "downloads.sourceforge.net/wsjt-z/"
  name "WSJT-Z"
  desc "Weak-signal digital communication software with automation features"
  homepage "https://wsjt-z.sourceforge.io/"

  livecheck do
    url "https://sourceforge.net/projects/wsjt-z/files/"
    regex(/wsjtz[._-]v?(\d+(?:[.-]\d+)+)[._-]Darwin/i)
  end

  app "wsjtx.app", target: "wsjtz.app"

  zap trash: [
    "~/Library/Application Support/WSJT-Z",
    "~/Library/Preferences/org.wsjtz.WSJTZ.plist",
    "~/Library/Saved Application State/org.wsjtz.WSJTZ.savedState",
  ]
end
