cask "sdroxide" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.7.4"
  sha256 arm:   "58d3b1ca176883aeec7f5a05a3d519ac3ba119235c97c0a7a9d38b36be6ad9a5",
         intel: "ab2c1dfcf9cbfbd4177e42d0bb44cc5ec0f21bbc40a6a3694adcc4e9712b9a21"

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
