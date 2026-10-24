cask "nexus" do
  version "1.20.0"
  sha256 "e1d3c946c84d380b3416c791f451446c9c443200439f19dcefd57eab96db5627"

  url "https://github.com/kd9taw/Nexus/releases/download/v#{version}/Nexus_#{version}_aarch64.dmg"
  name "Nexus"
  desc "Station app with needed-DX alerts, digital modes, rig control and logbook"
  homepage "https://hamradiotools.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
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
