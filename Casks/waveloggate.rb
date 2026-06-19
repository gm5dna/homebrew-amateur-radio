cask "waveloggate" do
  version "2.0.6"

  on_arm do
    sha256 "72397bf4026ea8a46c2a96772bda40cdddd0e1fad0cc2040cf454e077c18edbd"

    url "https://github.com/wavelog/WaveLogGate/releases/download/v#{version}/WavelogGate-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "d712ccb7afc3c63dce377ed9e998824b470aebc87f8332eab1f3b0364e2a75ed"

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
