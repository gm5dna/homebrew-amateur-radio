cask "ham-tools" do
  version "1.61.2"
  sha256 "d6af8319a0cb8c1b4c1e97d7b6b82fbb172b1396d7dc5f9c54fcd4c93c6312c0"

  url "https://toolbox.funkwelt.net/app/dmg/HAM-Tools-#{version}.dmg"
  name "HAM-Tools"
  desc "Logbook, DX cluster, WSPR, antenna modelling and radio calculators"
  homepage "https://toolbox.funkwelt.net/"

  livecheck do
    url "https://toolbox.funkwelt.net/app/dmg/"
    regex(/href=.*?HAM-Tools[._-]v?(\d+(?:\.\d+)+)\.dmg/i)
  end

  auto_updates true
  depends_on macos: :sonoma

  app "HAM-Tools.app"

  # ~/Documents/HAM-Tools (logbooks, exports, backups and the Winlink mailbox)
  # and ~/Library/Application Support/HAM-Tools (recorded voice macros) are
  # deliberately not zapped. The Winlink password is kept in the Keychain,
  # which zap cannot reach.
  zap trash: [
    "~/Library/Caches/com.hb9hji.hamrechner",
    "~/Library/HTTPStorages/com.hb9hji.hamrechner",
    "~/Library/Preferences/com.hb9hji.hamrechner.plist",
    "~/Library/Saved Application State/com.hb9hji.hamrechner.savedState",
  ]
end
