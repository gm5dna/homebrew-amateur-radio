cask "deskhpsdr" do
  version "2.7.21"
  sha256 "dd21aea6f32f733754b5c8fb08fa6f8dc4bdee4eb74a789145e04558b05a5fc0"

  url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version}/deskHPSDR-v#{version.major_minor}-latest-macos-arm64.zip"
  name "deskHPSDR"
  desc "Software-defined radio app for OpenHPSDR protocol 1 and 2 transceivers"
  homepage "https://github.com/dl1bz/deskhpsdr"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "deskHPSDR.app"

  zap trash: [
    "~/Library/Application Support/deskHPSDR",
    "~/Library/Preferences/org.dl1bz.deskhpsdr.plist",
    "~/Library/Saved Application State/org.dl1bz.deskhpsdr.savedState",
  ]

  caveats <<~EOS
    The bundle is not notarised. On first launch, Gatekeeper will block
    it: right-click deskHPSDR.app in Finder and choose "Open", then
    confirm in the dialog. Alternatively, run:

      xattr -r -d com.apple.quarantine /Applications/deskHPSDR.app

    Upstream provides Apple Silicon builds only; there is no Intel build.
  EOS
end
