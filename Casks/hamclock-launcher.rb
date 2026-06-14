cask "hamclock-launcher" do
  version "4.26"

  on_arm do
    sha256 "f0b508a6503b91d0729ec90007c6211d5bfae40f787c4b14a93fb1d472e93b46"

    url "https://github.com/huberthickman/HamClockLauncher/releases/download/release_#{version.tr(".", "_")}/HamClockLauncher.dmg"
  end
  on_intel do
    sha256 "3259ef7064089b644a1c7e6e9d4ba1bd80e53a78669b7a3e2b49c860e1c58a99"

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
