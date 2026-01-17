cask "sdrplusplus" do
  version "nightly"
  sha256 :no_check

  on_arm do
    url "https://github.com/AlexandreRouma/SDRPlusPlus/releases/download/nightly/sdrpp_macos_arm.zip"
  end
  on_intel do
    url "https://github.com/AlexandreRouma/SDRPlusPlus/releases/download/nightly/sdrpp_macos_intel.zip"
  end

  name "SDR++"
  desc "Cross-platform SDR software"
  homepage "https://github.com/AlexandreRouma/SDRPlusPlus"

  livecheck do
    skip "Nightly build with no versioned releases"
  end

  app "SDR++.app"

  zap trash: [
    "~/Library/Application Support/sdrpp",
    "~/Library/Preferences/sdrpp.plist",
  ]
end
