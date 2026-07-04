cask "flnet" do
  version "7.5.0"
  sha256 "08bac1646c97007bf49fac60a9ecb25ddc4b9601c3eaafa6557b519e77c02162"

  url "https://www.w1hkj.org/files/flnet/flnet-#{version}_BS.dmg",
      verified: "w1hkj.org/files/flnet/"
  name "flnet"
  desc "Net-control roster and check-in logging for the fldigi suite"
  homepage "http://www.w1hkj.com/"

  livecheck do
    url "https://www.w1hkj.org/files/flnet/"
    regex(/flnet-(\d+(?:\.\d+)+)_BS\.dmg/i)
  end

  depends_on :macos

  app "flnet-#{version}.app", target: "flnet.app"

  zap trash: [
    "~/.flnet",
    "~/Library/Preferences/com.w1hkj.flnet.plist",
    "~/Library/Saved Application State/com.w1hkj.flnet.savedState",
  ]
end
