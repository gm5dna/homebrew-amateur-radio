cask "sdrconnect" do
  version "1.0.6"

  on_arm do
    sha256 :no_check

    url "https://www.sdrplay.com/software/SDRconnect_darwin-arm64_583e89db6.dmg"

    depends_on macos: ">= :ventura"
  end
  on_intel do
    sha256 :no_check

    url "https://www.sdrplay.com/software/SDRconnect_darwin-x64_583e89db6.dmg"

    depends_on macos: ">= :catalina"
  end

  name "SDRconnect"
  desc "SDR application for SDRplay receivers with spectrum analysis"
  homepage "https://www.sdrplay.com/"

  livecheck do
    url "https://www.sdrplay.com/sdrconnect/"
    regex(/Latest\s+version:\s*v?(\d+(?:\.\d+)+)/i)
  end

  app "SDRconnect.app"

  zap trash: [
    "~/Library/Application Support/SDRconnect",
    "~/Library/Preferences/com.sdrplay.SDRconnect.plist",
    "~/Library/Saved Application State/com.sdrplay.SDRconnect.savedState",
  ]
end
