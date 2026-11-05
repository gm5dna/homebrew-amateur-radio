cask "rttytci" do
  version "0.3.1"
  sha256 "a092285e910605bbff465fbc75448cc8adb97f6aa32ad29d33e2517c2af7c68b"

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
    The bundle is not notarised, so Gatekeeper will block it on first
    launch: open the app, dismiss the warning, then choose "Open Anyway" in
    System Settings → Privacy & Security. Alternatively, run:

      xattr -r -d com.apple.quarantine /Applications/RTTY-TCI.app
  EOS
end
