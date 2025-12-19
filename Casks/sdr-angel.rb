cask "sdr-angel" do
  version "7.22.9"

  on_arm do
    sha256 "082bb21cfa74ed56a82c928c82f8a418ef9852bb5d542797e4d0ef49e20aa2c8"
    url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}-480-g11074ac87_mac-14.7.6_arm64.dmg"
  end

  on_intel do
    sha256 "af12179ca22ed510bbef9f35e690f599b5333c7dda469c9cc077bcbf94bc3e39"
    url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}_mac-13.7.6_x86_64.dmg"
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
