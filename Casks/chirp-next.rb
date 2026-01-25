cask "chirp-next" do
  version "20260123"
  sha256 "841a4c2e2792f797da0a578fd0ca0f39cbfa57e3206763916b092fc76d14334c"

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
