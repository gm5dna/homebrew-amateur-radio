cask "open-rig-programmer" do
  version "1.3.0"
  sha256 "06a9bb31258354ab249c2baac25f32e720e51c6604644bf835bb425777ac71ef"

  url "https://github.com/gm5dna/open-rig-programmer/releases/download/v#{version}/open-rig-programmer-v#{version}-darwin-universal.app.zip"
  name "Open Rig Programmer"
  desc "Memory-channel programmer for Yaesu and Icom transceivers"
  homepage "https://github.com/gm5dna/open-rig-programmer"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The bundle's LSMinimumSystemVersion is 10.13, but Homebrew no longer knows
  # any macOS symbol below Catalina, which is a higher floor than the app's.
  depends_on macos: :catalina

  app "Open Rig Programmer.app"

  # ~/Library/Application Support/rigprog is deliberately not zapped: it holds
  # the codeplug snapshots that are the write path's safety net, and it is
  # shared with the rigprog formula.
  zap trash: [
    "~/Library/Caches/io.github.gm5dna.open-rig-programmer",
    "~/Library/Preferences/io.github.gm5dna.open-rig-programmer.plist",
    "~/Library/Saved Application State/io.github.gm5dna.open-rig-programmer.savedState",
    "~/Library/WebKit/io.github.gm5dna.open-rig-programmer",
  ]

  caveats <<~EOS
    The macOS build is ad-hoc signed and not notarised. On first launch,
    Gatekeeper will block it: right-click Open Rig Programmer.app in Finder
    and choose "Open", then confirm in the dialog. Alternatively, run:

      xattr -d com.apple.quarantine "/Applications/Open Rig Programmer.app"
  EOS
end
