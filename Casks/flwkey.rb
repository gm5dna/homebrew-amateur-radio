cask "flwkey" do
  version "1.2.4"
  sha256 "278138b3b9f942f579bea3726e2c644f075fd7ba1511e438cf99f296e8f7a01c"

  url "https://www.w1hkj.org/files/flwkey/flwkey-#{version}.dmg",
      verified: "w1hkj.org/files/flwkey/"
  name "flwkey"
  desc "Control app for K1EL Winkeyer CW keyers"
  homepage "http://www.w1hkj.com/"

  livecheck do
    url "https://www.w1hkj.org/files/flwkey/"
    regex(/flwkey-(\d+(?:\.\d+)+)\.dmg/i)
  end

  depends_on :macos

  app "flwkey-#{version}.app", target: "flwkey.app"

  zap trash: [
    "~/.flwkey",
    "~/Library/Preferences/com.w1hkj.flwkey.plist",
    "~/Library/Saved Application State/com.w1hkj.flwkey.savedState",
  ]
end
