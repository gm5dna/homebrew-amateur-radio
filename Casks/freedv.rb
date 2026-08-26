cask "freedv" do
  version "2.4.0"
  sha256 "4e878758a10661287c666459ade9b4b09b66ee37d2d01654c06ede9830cd6e60"

  url "https://github.com/drowe67/freedv-gui/releases/download/v#{version}/FreeDV-#{version}.dmg",
      verified: "github.com/drowe67/freedv-gui/"
  name "FreeDV GUI"
  desc "Open-source HF digital voice modem and GUI for amateur radio"
  homepage "https://freedv.org/"

  livecheck do
    url "https://github.com/drowe67/freedv-gui"
    strategy :github_latest
  end

  depends_on :macos

  app "FreeDV.app"

  zap trash: [
    "~/Library/Application Support/FreeDV",
    "~/Library/Preferences/org.freedv.freedv.plist",
    "~/Library/Saved Application State/org.freedv.freedv.savedState",
  ]
end
