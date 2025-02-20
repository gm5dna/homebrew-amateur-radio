cask "sdrconnect" do
    version "1.0.3"

    on_arm do
        sha256 "c2069424681164da317b8b2203deb5cad6ccf05a36dbc38eb8d3f902f04d148c"
        url "https://www.sdrplay.com/software/SDRconnect_darwin-arm64_b6fce59a3.dmg"
      end
    
      on_intel do
        sha256 dc16974b9e4f48140142fca4a84e0c47c88c31a70a047b9d12e58d9d00a3413b
        url "https://www.sdrplay.com/software/SDRconnect_darwin-x64_b6fce59a3.dmg"
      end

    name "SDRconnect"
    desc "Software-defined radio (SDR) application by SDRplay"
    homepage "https://www.sdrplay.com/"
  
    app "SDRconnect.app"
  
    zap trash: [
      "~/Library/Application Support/SDRconnect",
      "~/Library/Preferences/com.sdrplay.SDRconnect.plist",
      "~/Library/Saved Application State/com.sdrplay.SDRconnect.savedState"
    ]
  end
  