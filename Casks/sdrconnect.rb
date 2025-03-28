cask "sdrconnect" do
  version "1.0.3"

  on_arm do
    sha256 :no_check

    url "https://www.sdrplay.com/software/SDRconnect_darwin-arm64_83273bcd8.dmg"
  end
  on_intel do
    sha256 :no_check

    url "https://www.sdrplay.com/software/SDRconnect_darwin-x64_83273bcd8.dmg"
  end

  name "SDRconnect"
  desc "Software-defined radio application by SDRplay"
  homepage "https://www.sdrplay.com/"

  app "SDRconnect.app"

  zap trash: [
    "~/Library/Application Support/SDRconnect",
    "~/Library/Preferences/com.sdrplay.SDRconnect.plist",
    "~/Library/Saved Application State/com.sdrplay.SDRconnect.savedState",
  ]
end
