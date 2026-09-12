cask "deskhpsdr" do
  version "2.7.39"
  sha256 "1dbb71c8fb156682585a40704cc80dc653ca1b0cccb91b21c5d94de872720b84"

  url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version}/deskHPSDR-v#{version}-macos-arm64.zip"
  name "deskHPSDR"
  desc "Software-defined radio app for OpenHPSDR protocol 1 and 2 transceivers"
  homepage "https://github.com/dl1bz/deskhpsdr"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on arch: :arm64
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
