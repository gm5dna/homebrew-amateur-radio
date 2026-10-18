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

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "QLog.app"

  # ~/Library/Application Support/hamradio/QLog is deliberately not zapped: it
  # holds the logbook (qlog.db).
  zap trash: [
    "~/Library/Preferences/com.hamradio.QLog.plist",
    "~/Library/Saved Application State/com.yourcompany.qlog.savedState",
  ]
end
