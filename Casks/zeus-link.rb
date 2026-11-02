cask "zeus-link" do
  arch arm: "arm64", intel: "x64"

  version "2.0.63"
  sha256 arm:   "4b11f690fbd95e429b45db0d212211b1605358bc07de0beb356484b1191b68c8",
         intel: "83a51e0f00506721622d26a144b692c462f3d9286feee7247eabfdae8acaf50b"

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
