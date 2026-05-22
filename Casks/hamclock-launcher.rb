cask "hamclock-launcher" do
  version "1.5"

  on_arm do
    sha256 "aef0d6c2750837009755f5a4a60bbe4a53916bba274e3f88ddaa95c39480d625"

    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.tr(".", "_")}/HamClockLauncher.dmg"
  end
  on_intel do
    sha256 "733a71c28a1a978a939e65da76bac7d0cc28906722ff214ed315bfa390909da4"

    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.tr(".", "_")}/HamClockLauncherIntel.dmg"
  end

  name "HamClock Launcher"
  desc "Launcher for HamClock application for amateur radio operators"
  homepage "https://github.com/huberthickman/HamClockLauncher"

  livecheck do
    url :url
    regex(/release[._](\d+(?:[._]\d+)+)/i)
    strategy :github_latest do |json, regex|
      json["tag_name"]&.scan(regex)&.map { |match| match[0].tr("_", ".") }
    end
  end

  depends_on macos: :big_sur

  app "HamClockLauncher.app"

  zap trash: [
    "~/Library/Application Support/HamClockLauncher",
    "~/Library/Preferences/com.huberthickman.HamClockLauncher.plist",
    "~/Library/Saved Application State/com.huberthickman.HamClockLauncher.savedState",
  ]
end
