cask "waveloggate" do
  version "1.1.6"
  sha256 :no_check

  on_arm do
    url "https://github.com/wavelog/WaveLogGate/releases/download/v#{version}/WaveLogGate-#{version}-arm64.dmg",
        verified: "github.com/wavelog/WaveLogGate/"
  end

  on_intel do
    url "https://github.com/wavelog/WaveLogGate/releases/download/v#{version}/WaveLogGate-#{version}-x64.dmg",
        verified: "github.com/wavelog/WaveLogGate/"
  end

  name "WaveLogGate"
  desc "Gateway utility for WaveLog amateur radio logging software"
  homepage "https://github.com/wavelog/WaveLogGate"

  app "WaveLogGate.app"

  zap trash: [
    "~/Library/Application Support/WaveLogGate",
    "~/Library/Preferences/com.wavelog.WaveLogGate.plist",
    "~/Library/Saved Application State/com.wavelog.WaveLogGate.savedState",
  ]
end
