cask "yaesu-web-control" do
  arch arm: "arm64", intel: "x64"

  version "2.5.5"
  sha256 arm:   "291b245e0d10696f52c2b7312dbd0678f4df11721d53eee3a5f7eb1ed6db1135",
         intel: "02de06cdefa6e40f96b270a53cd660dcaec0d87d8df7c7ae1c7d00609209c563"

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
