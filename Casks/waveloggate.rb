cask "waveloggate" do
  version "1.2.0"

  on_arm do
    sha256 "435e1fd85acb5eeb2c9bf237f1dda346a6d35d4bbacfbe4fffd843277588c175"

    url "https://github.com/wavelog/WaveLogGate/releases/download/v#{version}/WaveLogGate-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "9fc7fa930db35cebd4072d8253e61d90ee16ca34958c85c422cdd02c8e54dd39"

    url "https://github.com/wavelog/WaveLogGate/releases/download/v#{version}/WaveLogGate-#{version}-x64.dmg"
  end

  name "WaveLogGate"
  desc "Gateway utility for WaveLog amateur radio logging software"
  homepage "https://github.com/wavelog/WaveLogGate"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  app "WaveLogGate.app"

  zap trash: [
    "~/Library/Application Support/WaveLogGate",
    "~/Library/Preferences/com.wavelog.WaveLogGate.plist",
    "~/Library/Saved Application State/com.wavelog.WaveLogGate.savedState",
  ]
end
