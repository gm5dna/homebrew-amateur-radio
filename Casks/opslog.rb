cask "opslog" do
  version "0.51.27"
  sha256 "8a7588a53a4247fb25ef0710ee3af65d1e3e329be23d9328526a668e846d9827"

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
