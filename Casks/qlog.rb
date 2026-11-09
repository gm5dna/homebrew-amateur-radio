cask "qlog" do
  version "0.54.2"
  sha256 "0284ef93236fb6908d615b4bd1510dfe53a4da4a102cb06be9823c5d336f0780"

  url "https://github.com/aa5sh/QLog/releases/download/v#{version}/QLog-#{version}.zip"
  name "QLog"
  desc "Amateur radio logbook with DX cluster, rig control, and online log integration"
  homepage "https://github.com/aa5sh/QLog"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura
  container nested: "QLog.v#{version}.macos13-arm64.dmg"

  app "qlog.app"

  # ~/Library/Application Support/hamradio/QLog is deliberately not zapped: it
  # holds the logbook (qlog.db).
  zap trash: [
    "~/Library/Preferences/com.hamradio.QLog.plist",
    "~/Library/Saved Application State/com.yourcompany.qlog.savedState",
    "~/Library/Saved Application State/io.github.foldynl.qlog.savedState",
  ]
end
