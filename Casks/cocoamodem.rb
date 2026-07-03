cask "cocoamodem" do
  version "2.1rc5"
  sha256 "dede480fbba59f2b23a4705ecddb52aadc57af14238d4720d95151166e72b7e0"

  url "https://github.com/matpet/CocoaModem/releases/download/#{version}/cocoaModem-#{version}-macos-universal.zip"
  name "cocoaModem"
  desc "Amateur radio modem for RTTY, PSK31, MFSK, and other digital modes"
  homepage "https://github.com/matpet/CocoaModem"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+(?:rc\d+)?)$/i)
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "cocoaModem #{version}.app"

  zap trash: [
    "~/Library/Application Support/cocoaModem",
    "~/Library/Preferences/w7ay.cocoaModem-2.0.plist",
    "~/Library/Saved Application State/w7ay.cocoaModem-2.0.savedState",
  ]

  caveats <<~EOS
    This is a maintenance fork of W7AY's original cocoaModem, updated to
    run on macOS 15.7 and later as a universal binary.

    The bundle is not notarised. On first launch, Gatekeeper will block
    it: right-click the app in Finder and choose "Open", then confirm in
    the dialog. Alternatively, run:

      xattr -r -d com.apple.quarantine "/Applications/cocoaModem #{version}.app"

    Supported modes: RTTY, PSK31, MFSK16, Hellschreiber, CW, SITOR-B, HF-FAX
  EOS
end
