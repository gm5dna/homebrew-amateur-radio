cask "saleae-logic" do
  version "2.4.48"

  on_arm do
    sha256 "dc0c25c7726d80c8363f95b892401462563326b50ec8c15233491771d91a82d2"

    url "https://downloads2.saleae.com/logic2/Logic-#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "9540109b80062dfc128eb7e31b90e7b71c07ff5ec5d4ae796a3fca22d97743d0"

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

  depends_on :macos

  app "Saleae Logic.app"

  zap trash: [
    "~/Library/Application Support/Logic",
    "~/Library/Preferences/com.saleae.saleae.plist",
    "~/Library/Saved Application State/com.saleae.saleae.savedState",
  ]
end
