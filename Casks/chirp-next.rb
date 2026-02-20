cask "chirp-next" do
  version "20260220"
  sha256 :no_check

  url "https://archive.chirpmyradio.com/chirp_next/next-#{version}/chirp-next-#{version}.app.zip"
  name "CHIRP Next"
  desc "Open-source tool for programming amateur radio handhelds and mobiles"
  homepage "https://chirpmyradio.com/"

  livecheck do
    skip "Cloudflare blocks automated checks"
  end

  app "CHIRP.app"

  zap trash: [
    "~/Library/Application Support/CHIRP",
    "~/Library/Preferences/com.danplanet.chirp.plist",
    "~/Library/Saved Application State/com.danplanet.chirp.savedState",
  ]
end
