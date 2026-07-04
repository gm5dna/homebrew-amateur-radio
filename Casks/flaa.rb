cask "flaa" do
  version "1.0.2"
  sha256 "e8d7e610e6775d0e852c7876592dc2751adfafd00b8497a7cc1a643c551e6f88"

  url "https://www.w1hkj.org/files/flaa/flaa-#{version}.dmg",
      verified: "w1hkj.org/files/flaa/"
  name "flaa"
  desc "Antenna-analyser control for RigExpert AA-series instruments"
  homepage "http://www.w1hkj.com/"

  livecheck do
    url "https://www.w1hkj.org/files/flaa/"
    regex(/flaa-(\d+(?:\.\d+)+)\.dmg/i)
  end

  depends_on :macos

  app "flaa-.app", target: "flaa.app"

  zap trash: [
    "~/.flaa",
    "~/Library/Preferences/com.w1hkj.flaa.plist",
    "~/Library/Saved Application State/com.w1hkj.flaa.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
