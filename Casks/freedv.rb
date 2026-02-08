cask "freedv" do
  version "2.2.1"
  sha256 "1ad346f44760685993724698ee33f823f1ae39057e9170d2fae857eff7106a63"

  url "https://github.com/drowe67/freedv-gui/releases/download/v#{version}/FreeDV.dmg",
      verified: "github.com/drowe67/freedv-gui/"
  name "FreeDV GUI"
  desc "Open-source HF digital voice modem and GUI for amateur radio"
  homepage "https://freedv.org/"

  livecheck do
    url "https://github.com/drowe67/freedv-gui"
    strategy :github_latest
  end

  app "FreeDV.app"

  zap trash: [
    "~/Library/Application Support/FreeDV",
    "~/Library/Preferences/org.freedv.FreeDV.plist",
  ]
end
