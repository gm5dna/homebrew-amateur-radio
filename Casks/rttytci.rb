cask "rttytci" do
  version "0.1.1"
  sha256 "4c9a5e6e86881367f6a7245f159faa267cba3f2a02f12c6f59431bc2f91d4e33"

  url "https://github.com/dl1bz/rttyTCI/releases/download/#{version}/rttytci-macos-arm64.zip"
  name "rttyTCI"
  desc "RTTY transceiver app for SDRs using the TCI protocol"
  homepage "https://github.com/dl1bz/rttyTCI"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "RTTY-TCI.app"

  zap trash: [
    "~/Library/Application Support/RTTY-TCI",
    "~/Library/Preferences/org.dl1bz.rtty-tci.plist",
    "~/Library/Saved Application State/org.dl1bz.rtty-tci.savedState",
  ]

  caveats <<~EOS
    The bundle is not notarised. On first launch, Gatekeeper will block
    it: right-click RTTY-TCI.app in Finder and choose "Open", then
    confirm in the dialog. Alternatively, run:

      xattr -r -d com.apple.quarantine /Applications/RTTY-TCI.app

    Upstream provides Apple Silicon builds only; there is no Intel build.
  EOS
end
