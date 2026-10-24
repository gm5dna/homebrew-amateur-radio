cask "orbitdeck" do
  version "0.39.4"
  sha256 "3cb53bdb1499a14ce1b2b7d013a463b1948e36d09bb66c24fd41dd1e1b5f051f"

  url "https://github.com/prstoetzer/OrbitDeck/releases/download/v#{version}/OrbitDeck-macos-arm64.zip"
  name "OrbitDeck"
  desc "Satellite tracker with pass prediction and Doppler-corrected frequencies"
  homepage "https://github.com/prstoetzer/OrbitDeck"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "OrbitDeck.app"

  zap trash: [
    "~/.orbitdeck",
    "~/Library/Preferences/org.orbitdeck.app.plist",
    "~/Library/Saved Application State/org.orbitdeck.app.savedState",
  ]

  caveats <<~EOS
    The macOS build is ad-hoc signed and not notarised, so Gatekeeper will
    block it on first launch: open the app, dismiss the warning, then
    choose "Open Anyway" in System Settings → Privacy & Security.
    Alternatively, run:

      xattr -r -d com.apple.quarantine /Applications/OrbitDeck.app
  EOS
end
