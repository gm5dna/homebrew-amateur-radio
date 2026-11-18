cask "deskhpsdr" do
  on_arm do
    version "2.8.14,20261115,6f24906"
    sha256 "6ff1d18bd7eee1623ccabd35446c00b8296ccf3c803d03e39f0af2a6ad3e0e3f"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version.csv.first}/deskHPSDR-#{version.csv.first}-master-#{version.csv.third}-macos-arm64.zip"

    # The binary is `minos 26.0` although its plist still says 15.0.
    depends_on macos: :tahoe
  end
  # Upstream rebuilt only the arm64 zip of 2.8.14 (6f24906): Intel stays
  # on 4ade7ca. Livecheck runs on arm and will not flag a newer Intel build.
  on_intel do
    version "2.8.14,20261112,4ade7ca"
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
