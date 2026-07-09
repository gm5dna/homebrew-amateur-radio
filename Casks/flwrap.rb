cask "flwrap" do
  version "1.3.6"
  sha256 "fedd5942860932676b527e6d4811d486b9c12657d6834e59833780fe4bc52dbf"

  url "https://www.w1hkj.org/files/flwrap/flwrap-#{version}_BS.dmg"
  name "flwrap"
  desc "File encapsulation and checksums for radio file transfer"
  homepage "https://www.w1hkj.org/"

  livecheck do
    url "https://www.w1hkj.org/files/flwrap/"
    regex(/flwrap-(\d+(?:\.\d+)+)_BS\.dmg/i)
  end

  depends_on :macos

  app "flwrap-#{version}.app", target: "flwrap.app"

  zap trash: [
    "~/.flwrap",
    "~/Library/Preferences/com.w1hkj.flwrap.plist",
    "~/Library/Saved Application State/com.w1hkj.flwrap.savedState",
  ]
end
