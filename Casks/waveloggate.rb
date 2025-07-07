cask "waveloggate" do
  version "1.1.6"
  sha256 :no_check

  url "https://github.com/wavelog/WaveLogGate/releases/download/v#{version}/WaveLogGate-#{version}-universal.dmg"
  name "WaveLogGate"
  desc "Application"
  homepage "https://github.com/wavelog/WaveLogGate"

  app "WaveLogGate.app"

  zap trash: [
    "~/Library/Application Support/WaveLogGate",
    "~/Library/Preferences/com.wavelog.WaveLogGate.plist",
    "~/Library/Saved Application State/com.wavelog.WaveLogGate.savedState",
  ]
end
