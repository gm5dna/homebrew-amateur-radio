cask "freedv" do
  version "2.4.1"
  sha256 "e5683d1ac51ca36b9c3458bdfe604bf4b9718e89bdec2d1ccab6035967f2b287"

  url "https://github.com/drowe67/freedv-gui/releases/download/v#{version}/FreeDV-#{version}.dmg"
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
