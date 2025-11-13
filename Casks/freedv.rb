cask "freedv" do
  version "2.0.2"
  sha256 :no_check

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
