cask "hamclock-launcher" do
  version "4.33"

  on_arm do
    sha256 "022fb8547d59e1ccaad41d3496208bc7d27b2293284625392012d45fc0c995c0"

    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.tr(".", "_")}/HamClockLauncher.dmg"
  end
  on_intel do
    sha256 "306ccbf3f74086012fa47dcef7d21d7418e9d4bf8d312d363139e853e16f0ae2"

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

  depends_on :macos

  app "HamClockLauncher.app"

  zap trash: [
    "~/Library/Application Support/HamClockLauncher",
    "~/Library/Preferences/com.huberthickman.HamClockLauncher.plist",
    "~/Library/Saved Application State/com.huberthickman.HamClockLauncher.savedState",
  ]
end
