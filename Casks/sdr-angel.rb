cask "sdr-angel" do
  version "7.22.10"

  on_arm do
    sha256 "eab61dc31d23a943ebc58b0582a6058a79076b5738ba08b4136540c18d175f2d"
    url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}_mac-14.8.3_arm64.dmg"
  end

  on_intel do
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
