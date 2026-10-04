cask "zeus-link" do
  arch arm: "arm64", intel: "x64"

  version "2.0.44"
  sha256 arm:   "9943fd06774ef849ac3ff2e01773a56a53e173c09e4da60b2fd9c77d7c45ea19",
         intel: "d3e2fb9a5efe49ec0d6e16bbd8bf057c5da3511d1e01eb63749a87d761d8fa90"

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
