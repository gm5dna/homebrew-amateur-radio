cask "hermitsdr" do
  version "2026.1105_002"
  sha256 "f26ba65594cc8079aa613561f3e6aa235d238224d1f4d0f7725ff0d9fec30d27"

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
