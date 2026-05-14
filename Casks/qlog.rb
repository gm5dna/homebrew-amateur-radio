cask "qlog" do
  version "0.50.0"
  sha256 "7dbaad8f36751a826a558f90b11e4664b1a13bd6dabc209942bd12ebd309830b"

  url "https://github.com/aa5sh/QLog/releases/download/v#{version}/QLog.v#{version}.dmg"
  name "QLog"
  desc "Amateur radio logbook with DX cluster, rig control, and online log integration"
  homepage "https://github.com/aa5sh/QLog"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "QLog.app"

  zap trash: [
    "~/Library/Application Support/QLog",
    "~/Library/Preferences/com.qlog.QLog.plist",
    "~/Library/Saved Application State/com.qlog.QLog.savedState",
  ]
end
