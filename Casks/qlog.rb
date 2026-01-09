cask "qlog" do
  version "0.47.1"
  sha256 "fd8da5926d18f09e5ed536c0717c89eadbcf89833c7aec0ee620fbd2240d4e3e"

  url "https://github.com/aa5sh/QLog/releases/download/v#{version}/QLog.v#{version}.dmg"
  name "QLog"
  desc "Amateur radio logbook software"
  homepage "https://github.com/foldynl/QLog"

  livecheck do
    url "https://github.com/aa5sh/QLog/releases"
    strategy :github_latest
  end

  app "QLog.app"

  zap trash: [
    "~/Library/Application Support/QLog",
    "~/Library/Preferences/com.qlog.QLog.plist",
    "~/Library/Saved Application State/com.qlog.QLog.savedState",
  ]
end
