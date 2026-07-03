cask "deskhpsdr" do
  version "2.7.15"
  sha256 "d3ae7f6b2a835e94a856b58eb2aaac57816b91f9a81269bc002f623bf3ff7ea0"

  url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version}/deskHPSDR-macos-arm64.zip"
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
    "~/Library/Preferences/org.deskhpsdr.dl1bz.app.plist",
    "~/Library/Saved Application State/org.deskhpsdr.dl1bz.app.savedState",
  ]

  caveats <<~EOS
    The bundle is not notarised. On first launch, Gatekeeper will block
    it: right-click deskHPSDR.app in Finder and choose "Open", then
    confirm in the dialog. Alternatively, run:

      xattr -r -d com.apple.quarantine /Applications/deskHPSDR.app

    Upstream provides Apple Silicon builds only; there is no Intel build.
  EOS
end
