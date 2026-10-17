cask "zeus-link" do
  arch arm: "arm64", intel: "x64"

  version "2.0.53"
  sha256 arm:   "824bff32aab74c94179c6c66e40ee9763c7e52ee1e63b4303f940a6ee2a3ac86",
         intel: "c3a2da4d55460420152ca49673dcc3ec8d6202f3cd0b30efd78e54ab0d855d4b"

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
