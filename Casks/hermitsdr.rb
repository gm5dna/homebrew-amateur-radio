cask "hermitsdr" do
  version "2026.1016_002"
  sha256 "8694e521ef0b1b5bf08749ac9152cb5a7086690613da5b0b14c5a27cfe5ee738"

  url "https://github.com/dzcassell/HermitSDR-releases/releases/download/v#{version}/HermitSDR-#{version}.dmg"
  name "HermitSDR"
  desc "SDR client for Hermes-Lite 2, ANAN and other openHPSDR radios"
  homepage "https://hermitsdr.com/"

  livecheck do
    url :url
    regex(/^v?(\d+(?:[._]\d+)+)$/i)
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "HermitSDR.app"

  zap trash: [
    "~/Library/Application Support/com.hermitsdr.app",
    "~/Library/Application Support/HermitSDR",
    "~/Library/Caches/com.hermitsdr.app",
    "~/Library/Preferences/com.hermitsdr.app.plist",
    "~/Library/Saved Application State/com.hermitsdr.app.savedState",
  ]
end
