cask "scanastudio" do
  version "5.1.42"
  sha256 "56618647870b5d48415a076358e24581798e85fb79c8d3d39c5114feedcda310"

  url "https://cdn.ikalogic.com/dist/scanastudio/binaries/v#{version}/scanastudio_macos_v#{version}.dmg"
  name "ScanaStudio"
  desc "Interface software for Ikalogic logic analysers and pattern generators"
  homepage "https://www.ikalogic.com/"

  livecheck do
    url "https://www.ikalogic.com/logic-analyzers/sp259/software/"
    regex(/scanastudio_macos_v?(\d+(?:\.\d+)+)\.dmg/i)
  end

  depends_on :macos

  app "ScanaStudio.app"

  zap trash: [
    "~/Library/Application Support/ScanaStudio",
    "~/Library/Preferences/com.Ikalogic.ScanaStudio.plist",
    "~/Library/Saved Application State/com.Ikalogic.ScanaStudio.savedState",
  ]

  caveats do
    requires_rosetta
    <<~EOS
      The macOS build is an unsigned Intel binary (x86_64). On first launch,
      Gatekeeper will block it: right-click ScanaStudio.app in Finder and
      choose "Open", then confirm in the dialog. Alternatively, run:

        xattr -d com.apple.quarantine /Applications/ScanaStudio.app
    EOS
  end
end
