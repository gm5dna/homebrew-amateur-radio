cask "hamclock-launcher" do
  version "4.27"

  on_arm do
    sha256 "a22d24adc9d6ab1c074971dc81fb03d51db08ee5f3459c6f492f907a278aec11"

    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.tr(".", "_")}/HamClockLauncher.dmg"
  end
  on_intel do
    sha256 "731c2a5c008bfdbb0450ddf1d92a924476ed3e5dca358005e901658d2eed44cc"

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
