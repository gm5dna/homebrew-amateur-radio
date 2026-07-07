cask "deskhpsdr" do
  version "2.7.17"
  sha256 "26533a017d8c22485b00dc0ea3b4986c7a97a2ff39b919efd2ed3bd04ba76466"

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
