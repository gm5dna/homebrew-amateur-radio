cask "freedv" do
  version "2.1.0"
  sha256 "cf53592391e3ed6d5b40b546603b01dff63e74d3a25b821cf62dfd420823d30f"

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
