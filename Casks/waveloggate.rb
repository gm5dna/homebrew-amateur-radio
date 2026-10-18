cask "waveloggate" do
  version "2.2.0"

  on_arm do
    sha256 "ab19715aacf9d81bd710e38a1154030ef5ce349f66045e11c67a955bf239fef0"

    url "https://github.com/wavelog/WaveLogGate/releases/download/v#{version}/WavelogGate-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "25792196f20d416486814f687808560dc5642e59d5bdab69f0e571424285cfa0"

    url "https://github.com/wavelog/WaveLogGate/releases/download/v#{version}/WavelogGate-darwin-amd64.dmg"
  end

  name "WaveLogGate"
  desc "Gateway utility for WaveLog amateur radio logging software"
  homepage "https://github.com/wavelog/WaveLogGate"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on :macos

  app "WavelogGate.app"

  zap trash: [
    "~/Library/Application Support/WaveLogGate",
    "~/Library/Caches/com.wails.WavelogGate",
    "~/Library/Preferences/com.electron.waveloggate.plist",
    "~/Library/Preferences/com.wails.WavelogGate.plist",
    "~/Library/Saved Application State/com.wails.WavelogGate.savedState",
    "~/Library/WebKit/com.wails.WavelogGate",
  ]
end
