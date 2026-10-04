cask "open-sstv" do
  version "0.6.14"
  sha256 "169ad24a018c560edf16235600e87bc94ab25be955108605d505f7f55b7aa58a"

  url "https://github.com/bucknova/Open-SSTV/releases/download/v#{version}/open-sstv-macos-arm64.zip"
  name "Open-SSTV"
  desc "SSTV transceiver with rig control, QSO logbook, and image gallery"
  homepage "https://github.com/bucknova/Open-SSTV"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Open-SSTV.app"

  zap trash: [
    "~/Library/Application Support/open_sstv",
    "~/Library/Caches/open_sstv",
    "~/Library/Logs/open_sstv",
    "~/Library/Saved Application State/com.bucknova.OpenSSTV.savedState",
  ]

  caveats <<~EOS
    The bundle is ad-hoc signed, not notarised. On first launch, Gatekeeper
    will block it: right-click Open-SSTV.app in Finder and choose "Open",
    then confirm in the dialog. Alternatively, run:

      xattr -r -d com.apple.quarantine /Applications/Open-SSTV.app

    Upstream provides Apple Silicon builds only; Intel Macs need the pipx
    install described in the project README.
  EOS
end
