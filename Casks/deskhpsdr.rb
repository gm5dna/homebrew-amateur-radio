cask "deskhpsdr" do
  version "2.8.2"

  on_arm do
    sha256 "9f654fbac4864575c540b4098bd9ccaaec59293e72fe36cfbf889d0c7ae04095"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version}/deskHPSDR-#{version}-master-1d06ef5-macos-arm64.zip"
  end
  on_intel do
    sha256 "56c48c797465648862ad7b962a2b930d92a0d7ebd674d6b9bcd55bd647cc24b4"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version}/deskHPSDR-#{version}-master-1d06ef5-macos-x86_64.zip"
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
