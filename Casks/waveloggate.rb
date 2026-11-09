cask "waveloggate" do
  version "2.2.3"

  on_arm do
    sha256 "0a71e7c309266abf4dda46f5ea0f692ad324df50559101c21a372c960fd2637f"

    url "https://github.com/wavelog/WaveLogGate/releases/download/v#{version}/WavelogGate-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "b450ebf89b9fc8538adb8e6ad3908d970dc375648e6905e582da1fc077bad7d8"

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
