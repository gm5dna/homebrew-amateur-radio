cask "onair" do
  arch arm: "arm64", intel: "x86_64"

  version "3.6.0"
  sha256 arm:   "6979ecf60bd948e5d4dd04f19f48460b9bcbe61e934ef304b6c94a392479f418",
         intel: "eacd3ec686fe8ca60b6c3f44b5255c9782e94710df56a4306d6eb511a6ffe25a"

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
