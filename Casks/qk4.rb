cask "qk4" do
  version "0.8.0-beta.1"
  sha256 "2d3fc5190cbbcc0637c02a6c86fcd4ba67d6cd66af227857adb6d62d45d0de98"

  url "https://github.com/mikeg-dal/QK4/releases/download/v#{version}/QK4-#{version}-macos.dmg"
  name "QK4"
  desc "Remote control for the Elecraft K4 transceiver and KPA1500 amplifier"
  homepage "https://mikeg-dal.github.io/QK4/"

  livecheck do
    url "https://mikeg-dal.github.io/QK4/releases.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "QK4.app"

  # com.ai5qk.QK4 is the store from before the author's call sign change.
  zap trash: [
    "~/Library/Preferences/com.ai5qk.QK4.plist",
    "~/Library/Preferences/com.kf5o.QK4.plist",
    "~/Library/Preferences/com.qk4.QK4.plist",
    "~/Library/Saved Application State/com.kf5o.qk4.savedState",
  ]
end
