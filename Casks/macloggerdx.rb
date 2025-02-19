cask "macloggerdx" do
    version "6.54"
    sha256 "f8e1cc42d721578932ee57f217690116e1c28d1c43bf7d6a1ddacd2660630fd8"
  
    url "http://www.dogparksoftware.com/files/MacLoggerDX.dmg",
        verified: "dogparksoftware.com/"
    name "MacLoggerDX"
    desc "Powerful logging software for amateur radio operators"
    homepage "http://www.dogparksoftware.com/"
  
    app "MacLoggerDX.app"
  
    # zap trash: [
    #   "~/Library/Application Support/MacLoggerDX",
    #   "~/Library/Preferences/com.dogparksoftware.MacLoggerDX.plist",
    #   "~/Library/Saved Application State/com.dogparksoftware.MacLoggerDX.savedState",
    # ]
  end
  