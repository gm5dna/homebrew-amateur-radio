cask "htcommander" do
  version "0.1.91"
  sha256 "42c2dc75cdc3a4b42240db11bac337d6e6896b572135afbc116e0767f5c106c0"

  url "https://github.com/Ylianst/HTCommander/releases/download/v#{version}/htcommander-#{version}-macos.zip"
  name "HTCommander"
  desc "Controller for Benshi-family handheld radios such as the BTech UV-Pro"
  homepage "https://github.com/Ylianst/HTCommander"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "Handi-Talky Commander.app"

  # ~/Library/Application Support/com.meshcentral.htcommander is deliberately
  # not zapped: it holds the Winlink mailbox, comms history and recordings.
  zap trash: [
    "~/Library/Caches/com.meshcentral.htcommander",
    "~/Library/Preferences/com.meshcentral.htcommander.plist",
    "~/Library/Saved Application State/com.meshcentral.htcommander.savedState",
  ]
end
