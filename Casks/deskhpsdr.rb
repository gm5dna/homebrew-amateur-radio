cask "deskhpsdr" do
  version "2.8.14,20261112,4ade7ca"

  on_arm do
    sha256 "ecf53e1fa6dab843b2085cd708fc8e2955098feb779686aca1d433a2e82f09fe"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version.csv.first}/deskHPSDR-#{version.csv.first}-master-#{version.csv.third}-macos-arm64.zip"

    # The binary is `minos 26.0` although its plist still says 15.0.
    depends_on macos: :tahoe
  end
  on_intel do
    sha256 "a05ae79a27c49a49198356195433160d5394ae9291065d1093a8c9ed267e2961"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version.csv.first}/deskHPSDR-#{version.csv.first}-master-#{version.csv.third}-macos-x86_64.zip"

    depends_on macos: :sequoia
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

  app "deskHPSDR.app"

  zap trash: [
    "~/Library/Application Support/deskHPSDR",
    "~/Library/Preferences/org.dl1bz.deskhpsdr.plist",
    "~/Library/Saved Application State/org.dl1bz.deskhpsdr.savedState",
  ]
end
