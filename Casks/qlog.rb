cask "qlog" do
  version "0.50.0"
  sha256 "257beddb971292b8acc984ad46fb19a5d5e207126a78d4aa7f5a627b4ffdbae0"

  url "https://github.com/aa5sh/QLog/releases/download/v#{version}/QLog.v#{version}.dmg"
  name "QLog"
  desc "Amateur radio logbook with DX cluster, rig control, and online log integration"
  homepage "https://github.com/aa5sh/QLog"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  app "QLog.app"

  zap trash: [
    "~/Library/Application Support/QLog",
    "~/Library/Preferences/com.qlog.QLog.plist",
    "~/Library/Saved Application State/com.qlog.QLog.savedState",
  ]
end
