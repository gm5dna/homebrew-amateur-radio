cask "sigdigger" do
  version "0.3.0"
  sha256 "18314d22fdc0d41061312b02d088f6cb903292c741d1e4f6aa3371c804406c98"

  url "https://github.com/BatchDrake/SigDigger/releases/download/v#{version}/SigDigger-#{version}-x86_64.dmg"
  name "SigDigger"
  desc "Digital signal analyser for software-defined radio"
  homepage "https://batchdrake.github.io/SigDigger/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "SigDigger.app"

  zap trash: [
    "~/Library/Preferences/org.actinid.SigDigger.plist",
    "~/Library/Saved Application State/org.actinid.SigDigger.savedState",
  ]

  caveats do
    requires_rosetta
    <<~EOS
      The macOS build is an unsigned Intel binary (x86_64), so Gatekeeper
      will block it on first launch: open the app, dismiss the warning, then
      choose "Open Anyway" in System Settings → Privacy & Security.
      Alternatively, run:

        xattr -r -d com.apple.quarantine /Applications/SigDigger.app
    EOS
  end
end
