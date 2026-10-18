cask "open-rig-programmer" do
  version "1.10.0"
  sha256 "e226ac28907e1eb7c7f689a61110cea86a93ed0bedbba33eeb149cbc35e4bfa5"

  url "https://github.com/gm5dna/open-rig-programmer/releases/download/v#{version}/open-rig-programmer-v#{version}-darwin-universal.app.zip"
  name "Open Rig Programmer"
  desc "Memory-channel programmer for Yaesu and Icom transceivers"
  homepage "https://github.com/gm5dna/open-rig-programmer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

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
    The macOS build is ad-hoc signed and not notarised, so Gatekeeper will
    block it on first launch: open the app, dismiss the warning, then
    choose "Open Anyway" in System Settings → Privacy & Security.
    Alternatively, run:

      xattr -r -d com.apple.quarantine "/Applications/Open Rig Programmer.app"
  EOS
end
