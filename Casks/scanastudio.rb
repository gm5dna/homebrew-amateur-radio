cask "scanastudio" do
  version "6.0.16"
  sha256 "adb029829cdf2c19881963b9cfaef17f69d1be4b3cba2090839338685f22f6f8"

  url "https://cdn.ikalogic.com/dist/scanastudio-6/ScanaStudio_#{version}_universal.dmg"
  name "ScanaStudio"
  desc "Interface software for Ikalogic logic analysers and pattern generators"
  homepage "https://www.ikalogic.com/"

  livecheck do
    url "https://cdn.ikalogic.com/dist/scanastudio-6/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on :macos

  app "ScanaStudio.app"

  zap trash: [
    "~/Library/Application Support/com.ikalogic.scanastudio",
    "~/Library/Application Support/ScanaStudio",
    "~/Library/Caches/com.ikalogic.scanastudio",
    "~/Library/Preferences/com.ikalogic.scanastudio.plist",
    "~/Library/Saved Application State/com.ikalogic.scanastudio.savedState",
    "~/Library/WebKit/com.ikalogic.scanastudio",
  ]

  caveats <<~EOS
    The macOS build is ad-hoc signed and not notarised. On first launch,
    Gatekeeper will block it: right-click ScanaStudio.app in Finder and
    choose "Open", then confirm in the dialog. Alternatively, run:

      xattr -d com.apple.quarantine /Applications/ScanaStudio.app
  EOS
end
