cask "qttinysa" do
  version "2.0.1"
  sha256 arm:   "ab21308c8594b4d52661b7bafed3c2d0fe6e93689b53fd0fe00670370713e5d9",
         intel: "736f62c360d9bd937cd4e51915593b5ffcb68391a394d6fae6af56631c276c0d"

  on_arm do
    url "https://github.com/g4ixt/QtTinySA/releases/download/v#{version}/QtTinySA_macos_latest_arm64.zip"
  end
  on_intel do
    url "https://github.com/g4ixt/QtTinySA/releases/download/v#{version}/QtTinySA_macos_latest_x64.zip"
  end

  name "QtTinySA"
  desc "GUI application for the TinySA spectrum analyzer"
  homepage "https://github.com/g4ixt/QtTinySA"

  livecheck do
    url "https://github.com/g4ixt/QtTinySA"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on macos: :big_sur

  app "QtTinySA.app"

  zap trash: [
    "~/Library/Preferences/g4ixt.QtTinySA.plist",
    "~/Library/Saved Application State/g4ixt.QtTinySA.savedState",
  ]

  caveats <<~EOS
    Upgrading from 1.x: 2.x needs a newer preferences database, so on first
    launch it offers to replace the existing one. The old database is kept
    alongside it with a .110 suffix, and preset frequencies are exported to
    CSV first and can be restored when prompted.
  EOS
end
