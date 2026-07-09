cask "deskhpsdr" do
  version "2.7.19"
  sha256 "43d617ffa74f2bc00d2b5a28319848a2756586764171cb37165fdf0ec81b362f"

  url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version}/deskHPSDR-v#{version.major_minor}-macos-arm64.zip"
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
