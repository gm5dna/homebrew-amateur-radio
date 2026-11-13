cask "sdroxide" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.7.2"
  sha256 arm:   "099429da790c9b4df06e1d2cd764cc3bd81027ccfd11f6e5d488a6d2801242cb",
         intel: "5ed7a8ca87f79140a16d64a880dadeb05a976985e9de0626add99e593b28a0e2"

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
