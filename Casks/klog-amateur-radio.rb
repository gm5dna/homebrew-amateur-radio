cask "klog-amateur-radio" do
  arch arm: "arm64", intel: "intel"

  version "2.6"
  sha256 arm:   "711d74b7bb67e5d7e90c0121cbd724986bec40bfb5e820008530b8261720bab5",
         intel: "66a0e757a2321dd55ae44c74f0c9f188655c556315f3685e74b912e02489f6c3"

  url "https://github.com/ea4k/klog/releases/download/#{version}/KLog-#{version}-#{arch}.dmg"
  name "KLog"
  desc "Logger with DX cluster, QSL and DXCC management and Club Log upload"
  homepage "https://github.com/ea4k/klog"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "KLog.app"

  # ~/.klog is deliberately not zapped: it holds the logbook, its backups
  # and the klogrc settings file.
  zap trash: [
    "~/Library/Preferences/io.github.ea4k.klog.plist",
    "~/Library/Saved Application State/io.github.ea4k.klog.savedState",
  ]

  caveats <<~EOS
    The Apple Silicon build needs macOS 26 or later; the Intel build runs on
    macOS 11.7 or later.

    The macOS build is ad-hoc signed and not notarised, so Gatekeeper will
    block it on first launch: open the app, dismiss the warning, then
    choose "Open Anyway" in System Settings → Privacy & Security.
    Alternatively, run:

      xattr -r -d com.apple.quarantine /Applications/KLog.app
  EOS
end
