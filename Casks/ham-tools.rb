cask "ham-tools" do
  version "1.63.0"
  sha256 "f3ea1016d73c9dab1e63b16d7c92758e9a9995557f6fdf0e7be0083dd3e93ef8"

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
