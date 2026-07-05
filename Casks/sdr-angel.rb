cask "sdr-angel" do
  version "7.27.1"

  # The filenames embed the macOS version of the upstream build host
  # (e.g. mac-14.8.7), which changes between releases independently of the
  # SDRangel version — check the release assets when bumping.
  on_arm do
    sha256 "376089d47bdf7b90430304f39f72d853339c8c8e111fd1904f4ab15abf34b466"

    url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}_mac-14.8.7_arm64.dmg"
  end
  on_intel do
    sha256 "ae4e8eaa059899d0c5cbdf7c8c7f1390d446b753d0b7d47157875eeb069fd4c9"

    url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}_mac-15.7.7_x86_64.dmg"
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
