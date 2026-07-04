cask "flamp" do
  version "2.2.14"
  sha256 "9e95cbd69b9741362d191880ec74c7b35c05fca19da345ce3f71fcc4a2f8d194"

  url "https://www.w1hkj.org/files/flamp/flamp-#{version}_VN.dmg",
      verified: "w1hkj.org/files/flamp/"
  name "flamp"
  desc "Amateur Multicast Protocol file transfer for the fldigi suite"
  homepage "http://www.w1hkj.com/"

  livecheck do
    url "https://www.w1hkj.org/files/flamp/"
    regex(/flamp-(\d+(?:\.\d+)+)_VN\.dmg/i)
  end

  depends_on :macos

  app "flamp-#{version}.app", target: "flamp.app"

  zap trash: [
    "~/.nbems",
    "~/Library/Preferences/com.w1hkj.flamp.plist",
    "~/Library/Saved Application State/com.w1hkj.flamp.savedState",
  ]
end
