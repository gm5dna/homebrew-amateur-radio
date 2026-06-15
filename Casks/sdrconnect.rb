cask "sdrconnect" do
  version "1.0.9"

  # The download URLs embed an upstream build hash (..._a4b8da76b...) that is not
  # derived from `version`; refresh both URLs by hand when bumping the version.
  # `sha256 :no_check` is appropriate because the hashed URL is updated in place.

  on_arm do
    sha256 :no_check

    url "https://www.sdrplay.com/software/SDRconnect_darwin-arm64_d34bf923c.dmg"

    depends_on macos: :ventura
  end
  on_intel do
    sha256 :no_check

    url "https://www.sdrplay.com/software/SDRconnect_darwin-x64_d34bf923c.dmg"

    depends_on macos: :catalina
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
