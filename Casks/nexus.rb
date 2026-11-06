cask "nexus" do
  arch arm: "aarch64", intel: "x64"

  version "1.23.0"
  sha256 arm:   "68a9ebc0172e043f4cef28150eb7446febb998546feac0c5b0e7ced2f0c2e34a",
         intel: "e809ba150cf16e5b3b8eb0ce993406ff76b42ebe41b1d5e98f8e017f0a638af9"

  url "https://github.com/kd9taw/Nexus/releases/download/v#{version}/Nexus_#{version}_#{arch}.dmg"
  name "Nexus"
  desc "Station app with needed-DX alerts, digital modes, rig control and logbook"
  homepage "https://hamradiotools.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "Nexus.app"

  # ~/.config/tempo (and any ~/.config/tempo-<profile>) is deliberately not
  # zapped: it holds the logbook, its ADIF copy and backups, and recordings,
  # alongside settings.json.
  zap trash: [
    "~/Library/Caches/com.kd9taw.tempo",
    "~/Library/Preferences/com.kd9taw.tempo.plist",
    "~/Library/Saved Application State/com.kd9taw.tempo.savedState",
    "~/Library/WebKit/com.kd9taw.tempo",
  ]
end
