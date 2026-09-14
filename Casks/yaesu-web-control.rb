cask "yaesu-web-control" do
  arch arm: "arm64", intel: "x64"

  version "2.5.0"
  sha256 arm:   "30d576cb5b7dc715f5786da84015426444852db0dbea1b6b34a31f378f67a8c4",
         intel: "9290f1f5e18c93c5a8234f4130a1f9211f5ad1eb05a3a8e0903f8076f9e8767e"

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
  zap trash: "~/Library/Saved Application State/com.mm5agm.yaesuwebcontrol.savedState"

  caveats <<~EOS
    The macOS build is ad-hoc signed and not notarised. On first launch,
    Gatekeeper will block it: right-click Yaesu Web Control.app in Finder
    and choose "Open", then confirm in the dialog. Alternatively, run:

      xattr -d com.apple.quarantine "/Applications/Yaesu Web Control.app"
  EOS
end
