cask "chirp-next" do
  version "20260109"
  sha256 "5e2530eaba3abf06ab97e073633f2a78234e5558284108d6e66a8d9f646e0abe"

  url "https://archive.chirpmyradio.com/chirp_next/next-#{version}/chirp-next-#{version}.app.zip"
  name "CHIRP Next"
  desc "Radio programming software for amateur radio"
  homepage "https://chirpmyradio.com/"

  livecheck do
    url "https://archive.chirpmyradio.com/chirp_next/"
    regex(/next[._-](\d+)/i)
  end

  app "CHIRP.app"

  zap trash: [
    "~/Library/Application Support/CHIRP",
    "~/Library/Preferences/com.danplanet.chirp.plist",
    "~/Library/Saved Application State/com.danplanet.chirp.savedState",
  ]
end
