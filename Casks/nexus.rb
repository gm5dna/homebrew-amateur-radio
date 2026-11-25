cask "nexus" do
  arch arm: "aarch64", intel: "x64"

  version "1.25.1"
  sha256 arm:   "226af11831b6e8ce301d2a3209ee0626981443a34e8320542c7134771cd87fb8",
         intel: "a0ec53616f20387c67447d8bb7c30669cc235a3d1078a383089ce80b3d369d74"

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
