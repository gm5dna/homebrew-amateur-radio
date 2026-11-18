cask "onair" do
  arch arm: "arm64", intel: "x86_64"

  version "4.3.0"
  sha256 arm:   "025d6a89be7c2da504346da18f42e009e3bbbe44dd60ed3075ac625f0c0fcb59",
         intel: "ab667ccc93e29ed61eab7b080ebfd178559242f006196943d615daa98374d3d1"

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
