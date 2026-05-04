cask "sdr-angel" do
  version "7.25.0"

  on_arm do
    sha256 "47f94d3a1e97eb8437460891850959a591e2f50298bfea6835e4dbf30f52eb1c"

    url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}_mac-14.8.5_arm64.dmg"
  end
  on_intel do
    sha256 "57252af26bbfee6fec21a47f4f89a59dc820922dd7a468a750ed90655be63320"

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
