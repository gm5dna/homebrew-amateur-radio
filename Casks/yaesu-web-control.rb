cask "yaesu-web-control" do
  arch arm: "arm64", intel: "x64"

  version "2.5.1"
  sha256 arm:   "dd6cbadb18426c34613caba098d622c677a2681515622e114d013be08c3823e0",
         intel: "6296484a0ff693c0e3dd08048ba79ba89893ef060401fd08be098f212a49fbc5"

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
