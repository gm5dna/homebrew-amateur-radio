cask "zeus-link" do
  arch arm: "arm64", intel: "x64"

  version "2.0.64"
  sha256 arm:   "1d5bfdc60dcf08224bdbbd1416c9bd8283b62fe0b29ab9a3d62f71a3fbd916d7",
         intel: "67e9ddfc07cc3f94dd143d107005ea1c7fb8b402a4c03cb84704d024bb5e4c7e"

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
