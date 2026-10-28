cask "sdr-angel" do
  version "8.0.0"

  # The filenames embed the macOS version of the upstream build host
  # (e.g. mac-14.8.7), which changes between releases independently of the
  # SDRangel version — check the release assets when bumping.
  on_arm do
    sha256 "d9a62182b549054f021d897fa496d2ec6258fb9bb8b815d7ca578e2db28a1b68"

    url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}_mac-15.7.9_arm64.dmg"

    depends_on macos: :sequoia
  end
  on_intel do
    sha256 "47e2d9d5555ed578ca347a0ecebdc5182968e2dd66a0df96ab3431b1e2d8c162"

    url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}_mac-15.7.9_x86_64.dmg"

    depends_on macos: :sonoma
  end

  name "SDRangel"
  desc "Software defined radio receiver/transmitter application"
  homepage "https://github.com/f4exb/sdrangel"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  app "SDRangel.app"

  zap trash: [
    "~/Library/Application Support/f4exb/SDRangel",
    "~/Library/Preferences/com.f4exb.SDRangel.plist",
    "~/Library/Saved Application State/com.f4exb.SDRangel.savedState",
  ]
end
