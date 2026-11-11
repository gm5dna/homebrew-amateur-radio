cask "onair" do
  arch arm: "arm64", intel: "x86_64"

  version "3.9.0"
  sha256 arm:   "69c750bdf9db79760fcae1850989248febabf84c9d77db8216ccb7ddce5c8070",
         intel: "7d1bcdd0a8af90f2c9916e8ea54316b8021471b0ddbc6e5ffb9070663a55e732"

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
