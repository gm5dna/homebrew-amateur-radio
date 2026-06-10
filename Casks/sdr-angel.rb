cask "sdr-angel" do
  version "7.26.1"

  # The filenames embed the macOS version of the upstream build host
  # (e.g. mac-14.8.7), which changes between releases independently of the
  # SDRangel version — check the release assets when bumping.
  on_arm do
    sha256 "28a09630befe3746fba6c651c2cc82ea7a61489acd7d7891ccca3d37710fc5fe"

    url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}_mac-14.8.7_arm64.dmg"
  end
  on_intel do
    sha256 "3b2c72e74629eda9d9cbec0199c46fe3b465bb11a56bc7660de6f3039c3ddfcc"

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
