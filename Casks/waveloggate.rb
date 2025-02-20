cask "waveloggate" do
  version "1.1.0"
  sha256 "60508ed52a6a9469004d411234308105409784e38caceed0e85ddad261b77daa"

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
