cask "saleae-logic" do
  version "2.4.50"

  on_arm do
    sha256 "0eb670770116f1cbf0a8321553811d0853e25e0ef55efa81a032e9c75220a75b"

    url "https://downloads2.saleae.com/logic2/Logic-#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "887421beb7d4a46f06137280c04f5691f7f17ecf83cf87c9d6efc531ecbc86e6"

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

  depends_on macos: :monterey

  app "Saleae Logic.app"

  zap trash: [
    "~/Library/Application Support/Logic",
    "~/Library/Preferences/com.saleae.saleae.plist",
    "~/Library/Saved Application State/com.saleae.saleae.savedState",
  ]
end
