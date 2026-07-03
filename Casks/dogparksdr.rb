cask "dogparksdr" do
  version "1.27"
  sha256 "96ca893cdfcce3189ad3fc13b45c4358bc5016b1ec1eddd2be7dcb2165252b55"

  url "https://www.dogparksoftware.com/files/dogparkSDR#{version.no_dots}.dmg"
  name "dogparkSDR"
  desc "Client for FlexRadio Signature-series software-defined radios"
  homepage "https://www.dogparksoftware.com/dogparkSDR.html"

  livecheck do
    url :homepage
    regex(/Download:\s+v?(\d+(?:\.\d+)+)/i)
  end

  depends_on macos: :catalina

  app "dogparkSDR.app"

  zap trash: [
    "~/Library/Caches/com.dogparksoftware.dogparkSDR",
    "~/Library/HTTPStorages/com.dogparksoftware.dogparkSDR",
    "~/Library/Preferences/com.dogparksoftware.dogparkSDR*.plist",
    "~/Library/Saved Application State/com.dogparksoftware.dogparkSDR.savedState",
  ]
end
