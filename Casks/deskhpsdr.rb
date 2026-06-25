cask "deskhpsdr" do
  version "2.7.11"
  sha256 "bccb2a07bc4252601acad8dbe308bcc37af0fd99bfac85cb87a0070518faf4cf"

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
