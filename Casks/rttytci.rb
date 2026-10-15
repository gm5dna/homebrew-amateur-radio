cask "rttytci" do
  version "0.3.0"
  sha256 "61d59bd7e131b0c6c37276d86c888b5ad1d1fafcf741b1c2edd2a6c4e0f5bc59"

  url "https://github.com/dl1bz/rttyTCI/releases/download/#{version}/rttyTCI-macos-universal.zip"
  name "rttyTCI"
  desc "RTTY transceiver app for SDRs using the TCI protocol"
  homepage "https://github.com/dl1bz/rttyTCI"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on :macos

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
  EOS
end
