cask "freedv" do
  version "2.2.0"
  sha256 "9fe5785ae7e7b5c094f76fd32d271f724dbbd9779dc92acfbbca270fce7a8d83"

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
