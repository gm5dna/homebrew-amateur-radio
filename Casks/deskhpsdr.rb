cask "deskhpsdr" do
  version "2.8.12,20261101,4c1edb8"

  on_arm do
    sha256 "b3fa7b8ed1cca5b19712db580dd24e085be2be72a40a13726d36cff261e6715c"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version.csv.first}/deskHPSDR-#{version.csv.first}-master-#{version.csv.third}-macos-arm64.zip"

    # The binary is `minos 26.0` although its plist still says 15.0.
    depends_on macos: :tahoe
  end
  on_intel do
    sha256 "082c8cc1e6422788f746bc190fa571a039b40d4d0f5a6a3b67fc4832d217c7cf"

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
