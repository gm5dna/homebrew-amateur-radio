cask "morse-runner" do
  version "1.68"
  sha256 "36e7dc1fb3952c55d18badcbeaeafb9c8555e9f75308020d92f972c604728735"

  url "https://github.com/mikeg-dal/MorseRunner-KF5O/releases/download/v#{version}-macos/MorseRunner-#{version}-macOS.zip"
  name "Morse Runner"
  desc "CW contest simulator, a native port of VE3NEA's Morse Runner"
  homepage "https://mikeg-dal.github.io/MorseRunner-KF5O/"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)-macos$/i)
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "MorseRunner.app"

  # ~/Library/Application Support/MorseRunner (score list, HST results and
  # the session recording) is deliberately not zapped.
  zap trash: [
    "~/Library/Preferences/com.garciamike1.morserunner.plist",
    "~/Library/Saved Application State/com.garciamike1.morserunner.savedState",
  ]
end
