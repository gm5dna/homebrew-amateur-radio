cask "cocoamodem" do
  version "2.1rc6.2"
  sha256 "0f6bf2b2cdedc2be1fa3e30b5a542b6fd0ed5bfdda12ac43d1673dc0be62afc7"

  url "https://github.com/matpet/CocoaModem/releases/download/v#{version}/cocoamodem-#{version}-universal-macos.zip"
  name "cocoaModem"
  desc "Amateur radio modem for RTTY, PSK31, MFSK, and other digital modes"
  homepage "https://github.com/matpet/CocoaModem"

  livecheck do
    # The default regex would read v2.1rc6.2 as 2.1.
    url :url
    regex(/^v?(\d+(?:\.\d+)*rc\d+(?:\.\d+)*)$/i)
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "cocoaModem #{version} universal.app"

  zap trash: [
    "~/Library/Application Support/cocoaModem",
    "~/Library/Preferences/w7ay.cocoaModem-2.0.plist",
    "~/Library/Saved Application State/w7ay.cocoaModem-2.0.savedState",
  ]

  caveats <<~EOS
    This is a maintenance fork of W7AY's original cocoaModem, updated to
    run on macOS 15.7 and later as a universal binary.

    The bundle is not notarised, so Gatekeeper will block it on first
    launch: open the app, dismiss the warning, then choose "Open Anyway" in
    System Settings → Privacy & Security. Alternatively, run:

      xattr -r -d com.apple.quarantine "/Applications/cocoaModem #{version} universal.app"

    Supported modes: RTTY, PSK31, MFSK16, Hellschreiber, CW, SITOR-B, HF-FAX
  EOS
end
