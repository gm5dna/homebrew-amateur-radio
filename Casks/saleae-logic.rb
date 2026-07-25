cask "saleae-logic" do
  version "2.4.45"

  on_arm do
    sha256 "3ea97a69ee19bf8e49b9c2b108e6c3d645b7df73d848b28e626fd8ee8570da76"

    url "https://downloads2.saleae.com/logic2/Logic-#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "da81d33b709a6e02ea665fdad96efd552a4eadaf5a08399d9862112bba626291"

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

  depends_on macos: :catalina

  app "Saleae Logic.app"

  zap trash: [
    "~/Library/Application Support/Logic",
    "~/Library/Preferences/com.saleae.saleae.plist",
    "~/Library/Saved Application State/com.saleae.saleae.savedState",
  ]
end
