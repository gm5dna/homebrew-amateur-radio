cask "qttinysa" do
  version "2.0.1"
  sha256 arm:   "ab21308c8594b4d52661b7bafed3c2d0fe6e93689b53fd0fe00670370713e5d9",
         intel: "a13b879636ac8dfa996c397aada37973c907b266d87a7d19f3b5802a1633d45c"

  on_arm do
    url "https://github.com/g4ixt/QtTinySA/releases/download/v#{version}/QtTinySA_macos_latest_arm64.zip"
  end
  # Upstream's QtTinySA_macos_latest_x64.zip is built on an arm64 runner and
  # contains arm64 binaries; the macos-15_intel asset is the real x86_64 build.
  on_intel do
    url "https://github.com/g4ixt/QtTinySA/releases/download/v#{version}/QtTinySA_macos-15_intel.zip"
  end

  name "QtTinySA"
  desc "GUI application for the TinySA spectrum analyzer"
  homepage "https://github.com/g4ixt/QtTinySA"

  livecheck do
    url "https://github.com/g4ixt/QtTinySA"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on macos: :sequoia

  app "QtTinySA.app"

  zap trash: [
    "~/Library/Application Support/QtTinySA",
    "~/Library/Preferences/QtTinySA.plist",
    "~/Library/Saved Application State/QtTinySA.savedState",
  ]

  caveats <<~EOS
    Upgrading from 1.x: 2.x needs a newer preferences database, so on first
    launch it offers to replace the existing one. The old database is kept
    alongside it with a .110 suffix, and preset frequencies are exported to
    CSV first and can be restored when prompted.
  EOS
end
