cask "cocoanec" do
  version "0.92"
  sha256 :no_check

  url "http://www.w7ay.net/site/Downloads/cocoaNEC/cocoaNEC%20app.dmg"
  name "cocoaNEC"
  desc "NEC-2 antenna modeling application"
  homepage "http://www.w7ay.net/site/Applications/cocoaNEC/"

  livecheck do
    url "http://www.w7ay.net/site/Applications/cocoaNEC/Contents/Downloads.html"
    regex(/version\s*(\d+(?:\.\d+)+)/i)
  end

  app "cocoaNEC 2.0.app"

  zap trash: [
    "~/Library/Application Support/cocoaNEC",
    "~/Library/Preferences/net.w7ay.cocoaNEC.plist",
    "~/Library/Saved Application State/net.w7ay.cocoaNEC.savedState",
  ]
end
