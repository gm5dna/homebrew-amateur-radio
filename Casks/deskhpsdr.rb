cask "deskhpsdr" do
  version "2.8.3"

  on_arm do
    sha256 "867184a702c23b61e1047c45ef8339f9af6904665e409cd4c4b565cd9944e585"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version}/deskHPSDR-#{version}-master-98087a1-macos-arm64.zip"
  end
  on_intel do
    sha256 "b20c74d13f29889321e276a0811d6e850f5aa830c87da78242ded7ee1052a0d9"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version}/deskHPSDR-#{version}-master-98087a1-macos-x86_64.zip"
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
