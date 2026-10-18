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
    The bundle is not notarised, so Gatekeeper will block it on first
    launch: open the app, dismiss the warning, then choose "Open Anyway" in
    System Settings → Privacy & Security. Alternatively, run:

      xattr -r -d com.apple.quarantine /Applications/RTTY-TCI.app
  EOS
end
