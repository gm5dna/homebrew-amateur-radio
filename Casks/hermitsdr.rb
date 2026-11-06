cask "hermitsdr" do
  version "2026.1106_001"
  sha256 "1de636ca4e7755b0181607f3fd75473559a3d9717ae29f60b4225a5b57b063fc"

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
