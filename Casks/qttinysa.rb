cask "qttinysa" do
  version "1.2.5"
  sha256 arm:   "832ecbaa7ae4ff86c2a2793d8e5a37e9d8bc11325704771ae99c3b47dd017c74",
         intel: "6b74223380a30b309acb5de3f2646df6a1f7a1185cdd9fc3bc0f845e5363f835"

  on_arm do
    url "https://github.com/g4ixt/QtTinySA/releases/download/v#{version}/QtTinySA_mac_arm64.dmg"
  end
  on_intel do
    url "https://github.com/g4ixt/QtTinySA/releases/download/v#{version}/QtTinySA_mac_x86_64.dmg"
  end

  name "QtTinySA"
  desc "GUI application for the TinySA spectrum analyzer"
  homepage "https://github.com/g4ixt/QtTinySA"

  livecheck do
    url "https://github.com/g4ixt/QtTinySA"
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "QtTinySA.app"

  zap trash: [
    "~/Library/Preferences/g4ixt.QtTinySA.plist",
    "~/Library/Saved Application State/g4ixt.QtTinySA.savedState",
  ]
end
