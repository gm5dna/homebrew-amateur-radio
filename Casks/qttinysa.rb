cask "qttinysa" do
  version "1.2.5"
  sha256 arm:   "148011782abac559f32aef0cf4415ca40013be5d2e345bef549bb59341df08ca",
         intel: "d626e4d6d83dee2f69ef6b5ccfa36891c79172319c2962f78de0da7df50efe66"

  # Upstream's v1.2.5 release has no macOS assets, so these point at an
  # unofficial DMG build from the gm5dna fork (built from upstream's v1.2.5
  # tag via the project's own macos_build.yml). Revert to
  # g4ixt/QtTinySA once upstream attaches official macOS assets.
  on_arm do
    url "https://github.com/gm5dna/QtTinySA/releases/download/v#{version}/QtTinySA_mac_arm64.dmg"
  end
  on_intel do
    url "https://github.com/gm5dna/QtTinySA/releases/download/v#{version}/QtTinySA_mac_x86_64.dmg"
  end

  name "QtTinySA"
  desc "GUI application for the TinySA spectrum analyzer"
  homepage "https://github.com/g4ixt/QtTinySA"

  livecheck do
    url "https://github.com/g4ixt/QtTinySA"
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "QtTinySA.app"

  zap trash: [
    "~/Library/Preferences/g4ixt.QtTinySA.plist",
    "~/Library/Saved Application State/g4ixt.QtTinySA.savedState",
  ]
end
