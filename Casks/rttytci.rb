cask "rttytci" do
  version "0.2.1"
  sha256 "43ad30cabf6c099c101762e56cafa4b5353ebd7e2c19bf9728cdb3d2d7331b9d"

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
