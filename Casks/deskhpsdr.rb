cask "deskhpsdr" do
  version "2.8.8,20261010,20ba1a1"

  on_arm do
    sha256 "713d49c75fcf77d229cb06194e028ee9d4cec1f95bc199d353c165270ad00ecf"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version.csv.first}/deskHPSDR-#{version.csv.first}-master-#{version.csv.third}-macos-arm64.zip"
  end
  on_intel do
    sha256 "145653ac484ff34c0ea58f82eab907b8c3d4389f19b75b965afe4386073d899f"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version.csv.first}/deskHPSDR-#{version.csv.first}-master-#{version.csv.third}-macos-x86_64.zip"
  end

  name "deskHPSDR"
  desc "Software-defined radio app for OpenHPSDR protocol 1 and 2 transceivers"
  homepage "https://github.com/dl1bz/deskhpsdr"

  livecheck do
    url :homepage
    regex(/^deskHPSDR[._-]v?(\d+(?:\.\d+)+)[._-]master[._-](\h+)[._-]macos[._-]arm64\.zip$/i)
    strategy :github_latest do |json, regex|
      json["assets"]&.filter_map do |asset|
        match = asset["name"]&.match(regex)
        next unless match

        "#{match[1]},#{asset["created_at"]&.delete("-")&.slice(0, 8)},#{match[2]}"
      end
    end
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
