cask "onair" do
  arch arm: "arm64", intel: "x86_64"

  version "4.6.0"
  sha256 arm:   "2941e7774fa0828593dec7aab1d269e42c974cc45b8e54c319639b57e5e5e14f",
         intel: "fbd5f6fa0bc57cccc3c119dc42864a906845de7fc5aaf2ba75eb27282b21075f"

  url "https://github.com/adswill/OnAir/releases/download/v#{version}/OnAir-#{version}-macos-#{arch}.dmg"
  name "OnAir"
  desc "SDR receiver for digital TV, DAB+, aviation, satellites and ham modes"
  homepage "https://github.com/adswill/OnAir"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "OnAir.app"

  # ~/Library/Application Support/OnAir (recordings, the ham ADIF log,
  # user-installed codecs) and ~/Pictures/OnAir (saved images) are
  # deliberately not zapped.
  zap trash: [
    "~/Library/Caches/OnAir",
    "~/Library/Logs/OnAir",
    "~/Library/Preferences/io.github.adswill.onair.plist",
    "~/Library/Saved Application State/io.github.adswill.onair.savedState",
  ]

  caveats <<~EOS
    The macOS build is ad-hoc signed and not notarised, so Gatekeeper will
    block it on first launch: open the app, dismiss the warning, then
    choose "Open Anyway" in System Settings → Privacy & Security.
    Alternatively, run:

      xattr -r -d com.apple.quarantine /Applications/OnAir.app
  EOS
end
