cask "zeus-link" do
  arch arm: "arm64", intel: "x64"

  version "2.0.59"
  sha256 arm:   "5a36b7a322856917a39d917f11a2934c2b7cca319f2579bf5e880c0ec6a805f5",
         intel: "7ac92600c6d92711f756c504707d84682c97daba570f42c1bc14bd3d82698491"

  url "https://downloads.zeussdr.com/versions/#{version}/zeus-link-#{version}-macos-#{arch}.dmg"
  name "Zeus Link"
  name "ZeusSDR"
  desc "Launcher for the ZeusSDR OpenHPSDR station console"
  homepage "https://zeussdr.com/"

  # The manifest's `latest` can name a rolling build; only `release` entries are public.
  livecheck do
    url "https://downloads.zeussdr.com/manifest.json"
    strategy :json do |json|
      json["versions"]&.select { |item| item["channel"] == "release" }&.map { |item| item["version"] }
    end
  end

  auto_updates true
  depends_on macos: :monterey

  app "Zeus Link.app"

  zap trash: [
    "~/Library/Application Support/com.zeussdr.link",
    "~/Library/Caches/com.zeussdr.link",
    "~/Library/Preferences/com.zeussdr.link.plist",
    "~/Library/Saved Application State/com.zeussdr.link.savedState",
    "~/Library/WebKit/com.zeussdr.link",
  ]

  caveats <<~EOS
    Zeus Link downloads the ZeusSDR engine and console on first launch,
    updates them itself and requires a QRZ.com sign-in.
  EOS
end
