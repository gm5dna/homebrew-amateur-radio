cask "sdroxide" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.6.10"
  sha256 arm:   "77545bfdbe7dfe447b63e8b854beb76eee54aba40666693010b06c2f43231847",
         intel: "33657703ea101f334f8fbf86bbcf77160a45669ad09e97ebd0cb4d3034f39217"

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
