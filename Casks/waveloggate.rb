cask "waveloggate" do
  version "2.0.7"

  on_arm do
    sha256 "b7fabcc868ae5762ee2a14dbccee040257f19910725709ddb2de2219bd9a6b0e"

    url "https://github.com/wavelog/WaveLogGate/releases/download/v#{version}/WavelogGate-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "51a6b00508cd2d527f4df9112679a0b4b8284f338a31dab866472fef21e6d6f7"

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

  app "WaveLogGate.app"

  zap trash: [
    "~/Library/Application Support/WaveLogGate",
    "~/Library/Preferences/com.wavelog.WaveLogGate.plist",
    "~/Library/Saved Application State/com.wavelog.WaveLogGate.savedState",
  ]
end
