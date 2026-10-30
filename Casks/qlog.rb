cask "qlog" do
  version "0.54.1"
  sha256 "f5d11875653ec989d832a9418a2fb0ff5c712623db353fe4299c35ddb93b3204"

  url "https://github.com/aa5sh/QLog/releases/download/v#{version}/QLog.v#{version}.dmg"
  name "QLog"
  desc "Amateur radio logbook with DX cluster, rig control, and online log integration"
  homepage "https://github.com/aa5sh/QLog"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "QLog.app"

  # ~/Library/Application Support/hamradio/QLog is deliberately not zapped: it
  # holds the logbook (qlog.db).
  zap trash: [
    "~/Library/Preferences/com.hamradio.QLog.plist",
    "~/Library/Saved Application State/com.yourcompany.qlog.savedState",
    "~/Library/Saved Application State/io.github.foldynl.qlog.savedState",
  ]
end
