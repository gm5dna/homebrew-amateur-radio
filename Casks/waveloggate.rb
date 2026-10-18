cask "waveloggate" do
  version "2.2.1"

  on_arm do
    sha256 "545f9179c30e806aa5caeab7334d3988926a4e45b1c404fe5c98d78a1b3ebc51"

    url "https://github.com/wavelog/WaveLogGate/releases/download/v#{version}/WavelogGate-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "e0f01f0ef8d0d07637cf1aa0e912eafd971bdf24b8ab7e16e5503ea10ed35eec"

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
