cask "qttinysa" do
  version "2.0.3"
  sha256 arm:   "ead9e739b15f1350744f4eadb160eae4db759e7fb42c23f0f1150bae5426c740",
         intel: "aa266e8c205a6a351ea93b9aa8b10daef854ff4e67184c663db2bde0dafb47ac"

  on_arm do
    url "https://github.com/g4ixt/QtTinySA/releases/download/v#{version}/QtTinySA_macos_arm64.zip"
  end
  # Upstream's QtTinySA_macos_x64.zip is built on an arm64 runner and
  # contains arm64 binaries; the macos-15-intel asset is the real x86_64 build.
  on_intel do
    url "https://github.com/g4ixt/QtTinySA/releases/download/v#{version}/QtTinySA_macos-15-intel.zip"
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
