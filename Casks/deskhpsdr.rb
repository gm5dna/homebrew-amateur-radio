cask "deskhpsdr" do
  version "2.8.11,20261028,100a97b"

  on_arm do
    sha256 "804c7f79db62857f54fb23a37d971fc3b8e9999c73d56aab337b54ecda12a314"

    url "https://github.com/dl1bz/deskhpsdr/releases/download/#{version.csv.first}/deskHPSDR-#{version.csv.first}-master-#{version.csv.third}-macos-arm64.zip"

    # The binary is `minos 26.0` although its plist still says 15.0.
    depends_on macos: :tahoe
  end
  on_intel do
    sha256 "f0b802cbe87da6557db4ad739e8c2cde633e2ba657b81ac9a200e8011f2ed947"

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
