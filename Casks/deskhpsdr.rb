cask "deskhpsdr" do
  version "2.7.40"

  on_arm do
    sha256 "d2223e80c1b7a2b10252374435377daf0ffe04884670b4bccc407a338fe3e89b"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version}/deskHPSDR-#{version}-master-884c4bd-macos-arm64.zip"
  end
  on_intel do
    sha256 "e0859774e83058cd4605e2f9148b7003f98d274a8f17ff336201ec39abaaa02b"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version}/deskHPSDR-#{version}-master-884c4bd-macos-x86_64.zip"
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
