cask "htcommander" do
  version "0.2.0"
  sha256 "3c8f76a4af64bb7944ae178ff7abadb4b93cceb493f07754119969614fd1392e"

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
