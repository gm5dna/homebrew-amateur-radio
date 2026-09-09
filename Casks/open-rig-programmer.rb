cask "open-rig-programmer" do
  version "1.5.1"
  sha256 "e5954e2a1a7da38356120f34d7b030d3a6d46561adafb232897df7355a47c541"

  url "https://github.com/gm5dna/open-rig-programmer/releases/download/v#{version}/open-rig-programmer-v#{version}-darwin-universal.app.zip"
  name "Open Rig Programmer"
  desc "Memory-channel programmer for Yaesu and Icom transceivers"
  homepage "https://github.com/gm5dna/open-rig-programmer"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The bundle's LSMinimumSystemVersion is 10.13, but Homebrew no longer knows
  # any macOS symbol below Big Sur, which is a higher floor than the app's.
  depends_on macos: :big_sur

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
