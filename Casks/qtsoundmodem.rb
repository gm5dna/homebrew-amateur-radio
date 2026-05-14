cask "qtsoundmodem" do
  version "0.1.0"
  sha256 "ba41c07811159834e7f971c6387ac403b283d6234950d45e6f2e56d35ccc611d"

  url "https://github.com/gm5dna/qtsoundmodem-macos-port/releases/download/mac-#{version}/QtSoundModem-mac-#{version}.dmg"
  name "QtSoundModem"
  desc "AX.25 packet-radio soundmodem (UZ7HO QtSoundModem, Apple Silicon port)"
  homepage "https://github.com/gm5dna/qtsoundmodem-macos-port"

  livecheck do
    url :url
    regex(/^mac[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "QtSoundModem.app"

  zap trash: [
    "~/Library/Application Support/QtSoundModem",
    "~/Library/Preferences/com.gm5dna.qtsoundmodem.plist",
    "~/Library/Saved Application State/com.gm5dna.qtsoundmodem.savedState",
  ]

  caveats <<~EOS
    The bundle is ad-hoc signed only. On first launch, Gatekeeper will
    block it: right-click QtSoundModem.app in Finder and choose "Open",
    then confirm in the dialog. Alternatively, run:

      xattr -d com.apple.quarantine /Applications/QtSoundModem.app

    Microphone permission is requested on first audio open. If denied,
    the modem reads zero samples. Re-enable in:
      System Settings → Privacy & Security → Microphone

    Config and logs:
      ~/Library/Application Support/QtSoundModem/
  EOS
end
