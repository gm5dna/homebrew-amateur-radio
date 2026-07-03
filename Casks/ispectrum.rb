cask "ispectrum" do
  version "2.10"
  sha256 :no_check

  url "https://www.dogparksoftware.com/files/iSpectrum.dmg"
  name "iSpectrum"
  desc "Audio spectrum analyser with live frequency and waterfall display"
  homepage "https://www.dogparksoftware.com/iSpectrum.html"

  livecheck do
    url :homepage
    regex(/iSpectrum\s+v?(\d+(?:\.\d+)+)/i)
  end

  depends_on :macos

  app "iSpectrum.app"

  zap trash: [
    "~/Library/Application Support/iSpectrum",
    "~/Library/Preferences/com.dogparksoftware.iSpectrum.plist",
    "~/Library/Saved Application State/com.dogparksoftware.iSpectrum.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
