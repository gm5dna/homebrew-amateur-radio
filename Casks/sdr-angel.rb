cask "sdr-angel" do
  version "7.24.0"

  on_arm do
    sha256 "61e08d28ed7540c20539dbfa5a3dd7ecb7e35309ba9babc659cf58473b34c1af"

    url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}_mac-14.8.4_arm64.dmg"
  end
  on_intel do
    sha256 "31d6bc6cd7375826cdaaccc76317e43749c7f6a6ca1368bf9ce65105775d7c94"

    url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}_mac-15.7.5_x86_64.dmg"
  end

  name "SDRangel"
  desc "Software defined radio receiver/transmitter application"
  homepage "https://github.com/f4exb/sdrangel"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "SDRangel.app"

  zap trash: [
    "~/Library/Application Support/SDRangel",
    "~/Library/Preferences/org.f4exb.SDRangel.plist",
    "~/Library/Saved Application State/org.f4exb.SDRangel.savedState",
  ]
end
