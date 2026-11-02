cask "mac125" do
  version "0.5.3"
  sha256 "4c175d15e5d72f88d893550814865a9c00300896590a0197b922c2df2308a192"

  url "https://github.com/reflectingme/Mac125/releases/download/v#{version}/Mac125_v#{version}_macos.dmg"
  name "Mac125"
  desc "Memory programmer for the Uniden UBC125XLT scanner"
  homepage "https://gw3jvb.uk/software/mac125/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Mac125.app"

  # ~/Library/Application Support/Mac125Native is deliberately not zapped: it
  # holds the backups of scanner memory, the activity log and the recovery
  # copies of unsaved channel edits. Pairing trust is kept in the Keychain,
  # which zap cannot reach.
  zap trash: [
    "~/Library/Caches/uk.gw3jvb.mac125",
    "~/Library/HTTPStorages/uk.gw3jvb.mac125",
    "~/Library/Preferences/uk.gw3jvb.mac125.plist",
    "~/Library/Saved Application State/uk.gw3jvb.mac125.savedState",
  ]

  caveats <<~EOS
    The macOS build is ad-hoc signed and not notarised, so Gatekeeper will
    block it on first launch: open the app, dismiss the warning, then
    choose "Open Anyway" in System Settings → Privacy & Security.
    Alternatively, run:

      xattr -r -d com.apple.quarantine /Applications/Mac125.app
  EOS
end
