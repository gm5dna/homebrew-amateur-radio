cask "yaesu-web-control" do
  arch arm: "arm64", intel: "x64"

  version "2.5.4"
  sha256 arm:   "6eba3569855a01aa07a5682e40c508387ee87ec41403fc8f29a15aa2cd8044b8",
         intel: "78aab05283e5c1653543c74d956b623dd06e8053154a4b5f3212e165bc0e6b26"

  url "https://github.com/mm5agm/Yaesu_Web_Control/releases/download/v#{version}/Yaesu_Web_Control_CAT_#{version}_macos-#{arch}.dmg"
  name "Yaesu Web Control"
  desc "Browser-based CAT controller for Yaesu HF transceivers"
  homepage "https://github.com/mm5agm/Yaesu_Web_Control"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Yaesu Web Control.app"

  # ~/.config/MM5AGM/Yaesu Web Control is deliberately not zapped: it holds
  # the ADIF log of confirmed contacts and the CW transcripts.
  zap trash: [
    "~/Library/Preferences/com.mm5agm.yaesuwebcontrol.plist",
    "~/Library/Saved Application State/com.mm5agm.yaesuwebcontrol.savedState",
  ]

  caveats <<~EOS
    The macOS build is ad-hoc signed and not notarised, so Gatekeeper will
    block it on first launch: open the app, dismiss the warning, then
    choose "Open Anyway" in System Settings → Privacy & Security.
    Alternatively, run:

      xattr -r -d com.apple.quarantine "/Applications/Yaesu Web Control.app"
  EOS
end
