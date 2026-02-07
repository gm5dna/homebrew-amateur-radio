cask "chirp-next" do
  version "20260123"
  sha256 "841a4c2e2792f797da0a578fd0ca0f39cbfa57e3206763916b092fc76d14334c"

  url "https://archive.chirpmyradio.com/chirp_next/next-#{version}/chirp-next-#{version}.app.zip"
  name "CHIRP Next"
  desc "Open-source tool for programming amateur radio handhelds and mobiles"
  homepage "https://chirpmyradio.com/"

  livecheck do
    url "https://archive.chirpmyradio.com/download?stream=next&os=macos"
    strategy :header_match
    regex(/next[._-](\d+)/i)
  end

  # NOTE: Livecheck may fail due to Cloudflare bot protection on archive.chirpmyradio.com.
  # To check manually: curl -sI "https://archive.chirpmyradio.com/download?stream=next" | grep location

  app "CHIRP.app"

  zap trash: [
    "~/Library/Application Support/CHIRP",
    "~/Library/Preferences/com.danplanet.chirp.plist",
    "~/Library/Saved Application State/com.danplanet.chirp.savedState",
  ]
end
