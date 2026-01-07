cask "hamclock-launcher" do
  version "0.2"

  on_arm do
    sha256 "d40c5019175b411eaac4b4252f8591255664b764c2b9dc6f633c816901d483af"

    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version}/HamClockLauncher.dmg"
  end
  on_intel do
    sha256 "ea337409ecb7bca3913911aca5c57ec3f8b2c1a0c13b0605ae3a92a76e362aea"

    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version}/HamClockLauncherIntel.dmg"
  end

  name "HamClock Launcher"
  desc "Launcher for HamClock application for amateur radio operators"
  homepage "https://github.com/huberthickman/HamClockLauncher"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  app "HamClock Launcher.app"
end
