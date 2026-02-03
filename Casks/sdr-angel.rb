cask "sdr-angel" do
  version "7.23.1"

  on_arm do
    sha256 "ed2c2e54c8f0882965bfc88ae53bd4c24f00e2e320d7ec03a9f455e1309cd16a"

    url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}_mac-14.8.3_arm64.dmg"
  end
  on_intel do
    sha256 "41e70d7b5ae555679ed1b2f6a9179c1b80f02bb2a054455cf702bc18fb7c8c9d"

    url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}_mac-15.7.3_x86_64.dmg"
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
