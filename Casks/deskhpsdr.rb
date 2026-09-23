cask "deskhpsdr" do
  version "2.8.3"

  on_arm do
    sha256 "4fe39640535982452ff5c8771e70f63838d4264e891ec0231c44839fb8e638dc"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version}/deskHPSDR-#{version}-master-1d04da4-macos-arm64.zip"
  end
  on_intel do
    sha256 "f7dc97a743cb7f9f1fca30ca8e7c15bea943472f631846b593d6cc5f90f2841b"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version}/deskHPSDR-#{version}-master-1d04da4-macos-x86_64.zip"
  end

  name "deskHPSDR"
  desc "Software-defined radio app for OpenHPSDR protocol 1 and 2 transceivers"
  homepage "https://github.com/dl1bz/deskhpsdr"

  livecheck do
    url :homepage
    strategy :github_latest
  end

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
  EOS
end
