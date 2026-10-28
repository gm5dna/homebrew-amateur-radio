cask "opslog" do
  version "0.51.21"
  sha256 "a0a26c6bc9eb9c7531e7a5d1f788afe652f951378e62513d5ddbb65b602fd86d"

  url "https://github.com/GregTroar/OpsLog/releases/download/v#{version}/OpsLog-macos.zip"
  name "OpsLog"
  desc "Logger with CAT control, DX cluster, awards and QSL management"
  homepage "https://github.com/GregTroar/OpsLog"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "OpsLog.app"

  # ~/Library/Application Support/OpsLog is deliberately not zapped: its data
  # folder holds the logbook, backups, recordings and QSL templates alongside
  # the settings database. The bundle id is the Wails template default.
  zap trash: [
    "~/Library/Caches/com.wails.OpsLog",
    "~/Library/Preferences/com.wails.OpsLog.plist",
    "~/Library/Saved Application State/com.wails.OpsLog.savedState",
    "~/Library/WebKit/com.wails.OpsLog",
  ]

  caveats <<~EOS
    The macOS build is ad-hoc signed and not notarised, so Gatekeeper will
    block it on first launch: open the app, dismiss the warning, then
    choose "Open Anyway" in System Settings → Privacy & Security.
    Alternatively, run:

      xattr -r -d com.apple.quarantine /Applications/OpsLog.app
  EOS
end
