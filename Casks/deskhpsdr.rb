cask "deskhpsdr" do
  version "2.7.40"

  on_arm do
    sha256 "c62ea12dddfd5fa50fec17bf742b88d5879afbe1da6570e2dad1dda18b6c35cc"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version}/deskHPSDR-#{version}-master-d63db78-macos-arm64.zip"
  end
  on_intel do
    sha256 "48d295a235efbb862d456b910742f4403edde6490f49aa5a694f3632faa51229"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version}/deskHPSDR-#{version}-master-d63db78-macos-x86_64.zip"
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
