cask "mac125" do
  version "0.5.2"
  sha256 "529756c97e778e884349b672cb3d47ad275354d413b2f1e6b24b2ab582034abc"

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
    The macOS build is ad-hoc signed and not notarised. On first launch,
    Gatekeeper will block it: right-click Mac125.app in Finder and choose
    "Open", then confirm in the dialog. Alternatively, run:

      xattr -d com.apple.quarantine /Applications/Mac125.app
  EOS
end
