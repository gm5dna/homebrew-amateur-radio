cask "qlog" do
  version "0.53.0"
  sha256 "0495eed73c5b43faeced59f1d09caedd481f213ed79fd1f7b48aad563174945f"

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
