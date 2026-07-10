cask "saleae-logic" do
  version "2.4.44"

  on_arm do
    sha256 "c21c91749f6b9e04da35b8f6c55a44a3e496d9a250a1e3742cff2c1f62b66886"

    url "https://downloads2.saleae.com/logic2/Logic-#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "2c4317d58cf193078ee011dfda5fa74509d0d76bc8f45b8184096cbe7707d30c"

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
