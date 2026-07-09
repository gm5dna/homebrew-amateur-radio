cask "fllog" do
  version "1.2.9"
  sha256 "48ed1041b2eba035fab56a57684aeadc1872c36faa2cd7830eb47348f61d692b"

  url "https://www.w1hkj.org/files/fllog/fllog-#{version}.dmg"
  name "fllog"
  desc "Logbook server shared across the fldigi suite over XML-RPC"
  homepage "https://www.w1hkj.org/"

  livecheck do
    url "https://www.w1hkj.org/files/fllog/"
    regex(/fllog-(\d+(?:\.\d+)+)\.dmg/i)
  end

  depends_on :macos

  app "fllog-#{version}.app", target: "fllog.app"

  zap trash: [
    "~/.fllog",
    "~/Library/Preferences/com.w1hkj.fllog.plist",
    "~/Library/Saved Application State/com.w1hkj.fllog.savedState",
  ]
end
