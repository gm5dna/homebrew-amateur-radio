cask "chirp-next" do
  version "20251219"
  sha256 "e65fc0eb09d904f965f509762fc07b445c418cc807f1e4baa3ffdfd65d79be70"

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
