cask "deskhpsdr" do
  version "2.7.38"

  on_arm do
    sha256 "150647bc4a7f419bbb39f0cb7c1b03d07ad592820a6e1f983dd2f36383ca15ea"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version}/deskHPSDR-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "c54888d35669a2d524f6519042f7740e3cad0d6930e0bd8a262d0ceb0776f926"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version}/deskHPSDR-v#{version}-macos-x86_64.zip"
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
