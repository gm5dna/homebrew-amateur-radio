cask "qttinysa" do
  version "1.2.2"
  sha256 arm: "a712cbd51c5e58dfe78fa4c8f7b34b549f94a840dc2fcdf816a9c9bbb9050d4e",
         intel: "7e3a4327c28409e83478617ca62074a3bb1b6d23683ad23470660e16782507a8"

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

  app "QtTinySA.app"

  zap trash: [
    "~/Library/Preferences/g4ixt.QtTinySA.plist",
    "~/Library/Saved Application State/g4ixt.QtTinySA.savedState",
  ]
end
