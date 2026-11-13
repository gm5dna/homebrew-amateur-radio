cask "nexus" do
  arch arm: "aarch64", intel: "x64"

  version "1.24.0"
  sha256 arm:   "bb8ef39905fa57f77d50eb868f85c16d6bf4951ced000c17686e73bda5f42811",
         intel: "369149f4b3423df6281f80cf54e3bc2331b757dea562e3550b42b401981c9fb7"

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
