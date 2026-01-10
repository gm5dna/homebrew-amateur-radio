cask "sdrplusplus-brown" do
  version "rolling"
  sha256 :no_check

  on_arm do
    url "https://github.com/sannysanoff/SDRPlusPlusBrown/releases/download/rolling/sdrpp_macos_arm.zip"
  end
  on_intel do
    url "https://github.com/sannysanoff/SDRPlusPlusBrown/releases/download/rolling/sdrpp_macos_intel.zip"
  end

  name "SDR++ Brown"
  desc "Cross-platform SDR software with brown UI theme"
  homepage "https://github.com/sannysanoff/SDRPlusPlusBrown"

  livecheck do
    url :homepage
    strategy :page_match
    regex(/sdrpp_macos_(?:arm|intel)\.zip/i)
  end

  app "SDR++Brown.app"

  zap trash: [
    "~/Library/Application Support/sdrpp",
    "~/Library/Preferences/sdrpp.plist",
  ]
end
