cask "chirp-next" do
  version "20260102"
  sha256 "1eae322be4d839792a94eb2bcb3d5fe16bd199613cbf3772eb9fdfadedfd56ac"

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
