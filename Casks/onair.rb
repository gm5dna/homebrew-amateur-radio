cask "onair" do
  arch arm: "arm64", intel: "x86_64"

  version "3.3.0"
  sha256 arm:   "4fdd4bd0f6b8e9414bd99888a5c572df0bd9551cc105068d4b0ede04f6deec64",
         intel: "ed3b72ec3d754831a3180b8cd13893a65d70306a42e127ad3d2877b46c3c58eb"

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
