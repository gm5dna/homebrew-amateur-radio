cask "sdr-angel" do
  # The filenames embed the macOS version of the upstream build host
  # (e.g. mac-14.8.7), which changes between releases independently of the
  # SDRangel version — check the release assets when bumping. The separator
  # before it changed from `_mac-` to `-mac-` in 8.1.0.
  on_arm do
    version "8.1.0"
    sha256 "c746391cffb28bdb68bc1bb7e2ad9816abb4b3d32ffdab9f181ab71df66c0787"

    url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}-mac-15.8.2_arm64.dmg"

    depends_on macos: :sequoia
  end
  # Upstream's 8.1.0 release has no x86_64 DMG, so Intel stays on 8.0.0
  # until one is attached. Livecheck runs on arm and will not flag it.
  on_intel do
    version "8.0.0"
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
