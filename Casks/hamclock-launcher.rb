cask "hamclock-launcher" do
  version "4.31"

  on_arm do
    sha256 "5cb67c4e8bcadb06e7070494db3ac3779fd3561cf70353b25641d0a0fa87f5d4"

    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.tr(".", "_")}/HamClockLauncher.dmg"
  end
  on_intel do
    sha256 "cba1a12187866b3916a1a39ed5ce740786082c28b17f91569702417c1c97ac37"

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
