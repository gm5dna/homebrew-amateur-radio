cask "saleae-logic" do
  version "2.4.46"

  on_arm do
    sha256 "942d1a48f1d377345fbc06a8c00e892e4a8c59659c62ea42a941471ea3b7d94b"

    url "https://downloads2.saleae.com/logic2/Logic-#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "6ffe97de7ac195aec06b2ba3cc3ea1930698fed83c9c87a2d1808a52223424c8"

    url "https://downloads2.saleae.com/logic2/Logic-#{version}-macos-x64.zip"
  end

  name "Saleae Logic"
  desc "Logic analyser and oscilloscope software for Saleae Logic devices"
  homepage "https://www.saleae.com/"

  livecheck do
    url "https://logic2api.saleae.com/download?os=osx&arch=arm64"
    regex(/Logic[._-]v?(\d+(?:\.\d+)+)[._-]macos/i)
    strategy :header_match
  end

  depends_on macos: :big_sur

  app "Saleae Logic.app"

  zap trash: [
    "~/Library/Application Support/Logic",
    "~/Library/Preferences/com.saleae.saleae.plist",
    "~/Library/Saved Application State/com.saleae.saleae.savedState",
  ]
end
