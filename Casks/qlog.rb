cask "qlog" do
  version "0.54.2"
  sha256 "ba1b77c2520a54b928de0add1a87cdb3302e1232d93e5da6dba2ee973546a975"

  url "https://github.com/aa5sh/QLog/releases/download/v#{version}/QLog.v#{version}.macos13-arm64.dmg"
  name "QLog"
  desc "Amateur radio logbook with DX cluster, rig control, and online log integration"
  homepage "https://github.com/aa5sh/QLog"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "qlog.app"

  # ~/Library/Application Support/hamradio/QLog is deliberately not zapped: it
  # holds the logbook (qlog.db).
  zap trash: [
    "~/Library/Preferences/com.hamradio.QLog.plist",
    "~/Library/Saved Application State/com.yourcompany.qlog.savedState",
    "~/Library/Saved Application State/io.github.foldynl.qlog.savedState",
  ]
end
