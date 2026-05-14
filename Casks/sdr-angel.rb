cask "sdr-angel" do
  version "7.25.1"

  on_arm do
    sha256 "08faf0ae91d3343dc8809366e464a84f0af6bf7152beba0124e654d4a65d2272"

    url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}_mac-14.8.5_arm64.dmg"
  end
  on_intel do
    sha256 "b2f64072c48903e03b58b1c78ca9ee47d2a84884fd7640bfc01ea3a9eb006e4a"

    url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}_mac-15.7.5_x86_64.dmg"
  end

  name "SDRangel"
  desc "Software defined radio receiver/transmitter application"
  homepage "https://github.com/f4exb/sdrangel"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "SDRangel.app"

  zap trash: [
    "~/Library/Application Support/SDRangel",
    "~/Library/Preferences/org.f4exb.SDRangel.plist",
    "~/Library/Saved Application State/org.f4exb.SDRangel.savedState",
  ]
end
