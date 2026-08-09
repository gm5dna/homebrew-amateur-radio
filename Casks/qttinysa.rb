cask "qttinysa" do
  version "2.0.0"
  sha256 arm:   "66253de8d2070c84b021fba99fbb8587d613f2a303d87bfb9f859980f79096c7",
         intel: "fae454008416242dd2deb9ac0fbfb980c5ccdeda795eac79c13943bcc11967a7"

  # Upstream's V2.0.0 macOS asset (QtTinySA_macos.zip) is arm64 only, so these
  # point at an unofficial dual-arch DMG build from the gm5dna fork, built from
  # upstream's V2.0.0 tag via the project's own PYI_macos_latest.yml. Revert to
  # g4ixt/QtTinySA once upstream ships universal or dual-arch macOS assets.
  # Note the upstream tag capitalises the V.
  on_arm do
    url "https://github.com/gm5dna/QtTinySA/releases/download/V#{version}/QtTinySA_mac_arm64.dmg"
  end
  on_intel do
    url "https://github.com/gm5dna/QtTinySA/releases/download/V#{version}/QtTinySA_mac_x86_64.dmg"
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
    Upgrading from 1.x: 2.0.0 needs a newer preferences database, so on first
    launch it offers to replace the existing one. The old database is kept
    alongside it with a .110 suffix, and preset frequencies are exported to
    CSV first and can be restored when prompted.
  EOS
end
