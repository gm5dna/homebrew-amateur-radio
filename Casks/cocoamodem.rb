cask "cocoamodem" do
  version "1.03"
  sha256 :no_check

  url "https://www.w7ay.net/site/Downloads/cocoaModem/cocoaModem%20app.dmg"
  name "cocoaModem"
  desc "Amateur radio modem for RTTY, PSK31, MFSK, and other digital modes"
  homepage "https://www.w7ay.net/site/Applications/cocoaModem/"

  livecheck do
    skip "No version information available on website"
  end

  app "cocoaModem 2.0.app"

  zap trash: [
    "~/Library/Application Support/cocoaModem",
    "~/Library/Preferences/w7ay.cocoaModem-2.0.plist",
    "~/Library/Saved Application State/w7ay.cocoaModem-2.0.savedState",
  ]

  caveats <<~EOS
    cocoaModem was last updated in 2012 and officially supports macOS 10.4-10.8.
    It may work on newer versions of macOS but is not actively maintained.

    Supported modes: RTTY, PSK31/63/125, MFSK16, Hellschreiber, CW, SITOR-B, HF-FAX
  EOS
end
