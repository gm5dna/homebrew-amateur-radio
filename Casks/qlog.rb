cask "qlog" do
  version "0.48.0"
  sha256 "0a1a64c6742ac4199deccfc544538434ccbe5e1df69bc0a3ab81666e726dcded"

  url "https://github.com/aa5sh/QLog/releases/download/v#{version}/QLog.v#{version}.dmg"
  name "QLog"
  desc "Amateur radio logbook software"
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
