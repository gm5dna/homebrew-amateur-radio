cask "sdroxide" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.7.3"
  sha256 arm:   "8de101fb90e3ccda74178d03e5678ac66dd8ff0317d9bd949d24dba380dfcfb4",
         intel: "894ea89214112fc3bb56674d19f5288301296d0e80d94a9a6f59eab78d734499"

  url "https://github.com/dividebysandwich/sdroxide/releases/download/v#{version}/sdroxide-v#{version}-macos-#{arch}.dmg"
  name "SDR Oxide"
  desc "SDR transceiver client with skimmers, digital modes and Winlink"
  homepage "https://sdroxide.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "sdroxide.app"

  # ~/.config/sdroxide is deliberately not zapped: it holds the QSO log,
  # Winlink mail, SSTV images and recordings alongside the settings.
  zap trash: [
    "~/Library/Preferences/com.github.dividebysandwich.sdroxide.plist",
    "~/Library/Saved Application State/com.github.dividebysandwich.sdroxide.savedState",
  ]

  caveats <<~EOS
    The macOS build is ad-hoc signed and not notarised, so Gatekeeper will
    block it on first launch: open the app, dismiss the warning, then
    choose "Open Anyway" in System Settings → Privacy & Security.
    Alternatively, run:

      xattr -r -d com.apple.quarantine /Applications/sdroxide.app
  EOS
end
