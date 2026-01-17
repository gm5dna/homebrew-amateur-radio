cask "waveloggate" do
  version "1.1.14"

  on_arm do
    sha256 "f9ab836563a73ad554e9bbb32c17c59a871585a538a35a9c81bc8172e7a1e89b"

    url "https://github.com/wavelog/WaveLogGate/releases/download/v#{version}/WaveLogGate-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "33e05dd4bc5585c5d0defda314ab0b6b8d6f5494dfe3fe8acea89c06eab3caa0"

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
