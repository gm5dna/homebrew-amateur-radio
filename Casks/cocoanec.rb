cask "cocoanec" do
  version "0.92"
  sha256 :no_check

  url "https://www.w7ay.net/site/Downloads/cocoaNEC/cocoaNEC%20app.dmg"
  name "cocoaNEC"
  desc "NEC-2 antenna modeling application"
  homepage "https://www.w7ay.net/site/Applications/cocoaNEC/"

  livecheck do
    url "https://www.w7ay.net/site/Applications/cocoaNEC/Contents/Downloads.html"
    regex(/version\s*(\d+(?:\.\d+)+)/i)
  end

  depends_on :macos

  app "cocoaNEC 2.0.app"

  zap trash: [
    "~/Library/Application Support/cocoaNEC",
    "~/Library/Preferences/w7ay.cocoaNEC-2.0.plist",
    "~/Library/Saved Application State/w7ay.cocoaNEC-2.0.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
