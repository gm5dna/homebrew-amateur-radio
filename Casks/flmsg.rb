cask "flmsg" do
  version "4.0.24"
  sha256 "1f47338e2c18d27ef0c9f25ac60a61049a7797a0a751b2cf30c58a949e5ee4a8"

  url "https://www.w1hkj.org/files/flmsg/flmsg-#{version}.dmg"
  name "flmsg"
  desc "NBEMS structured-message and forms editor for the fldigi suite"
  homepage "https://www.w1hkj.org/"

  livecheck do
    url "https://www.w1hkj.org/files/flmsg/"
    regex(/flmsg-(\d+(?:\.\d+)+)\.dmg/i)
  end

  depends_on :macos

  app "flmsg-#{version}.app", target: "flmsg.app"

  zap trash: [
    "~/.nbems",
    "~/Library/Preferences/com.w1hkj.flmsg.plist",
    "~/Library/Saved Application State/com.w1hkj.flmsg.savedState",
  ]
end
