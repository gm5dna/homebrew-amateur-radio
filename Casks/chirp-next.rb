cask "chirp-next" do
  version "20260116"
  sha256 "4a6cbcd3f497b97733c6bf69a948c011787fd1af3b1f0d33a447db1cd8c8d424"

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
