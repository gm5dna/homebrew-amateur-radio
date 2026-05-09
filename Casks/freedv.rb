cask "freedv" do
  version "2.3.0"
  sha256 "ed714f9ce4925c3bf9a0999a5ae01e48c3804e4d4c15e518d7b818ede5db7d45"

  url "https://github.com/drowe67/freedv-gui/releases/download/v#{version}/FreeDV-#{version}.dmg",
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
    "~/Library/Saved Application State/org.freedv.FreeDV.savedState",
  ]
end
