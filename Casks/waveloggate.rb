cask "waveloggate" do
  version "2.2.2"

  on_arm do
    sha256 "88ca30f590736015e350d2610ad7fc54a7d874837cbb0a59e501620cde37f209"

    url "https://github.com/wavelog/WaveLogGate/releases/download/v#{version}/WavelogGate-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "c3401a7cc741bff094afd5ee377a62250193fd11e20522e7630599e85f75490d"

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
