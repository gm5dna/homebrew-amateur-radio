cask "macwinlink" do
  version "1.0.0-beta20,2026-07-09,46a1d1d"
  sha256 "15ea58064aff383d428810b01209e11928812cab13f44397059aa63363ec700a"

  url "https://github.com/jjones9527/macwinlink-releases/releases/download/v#{version.csv.first}/MacWinlink_#{version.csv.second}_#{version.csv.third}.dmg"
  name "MacWinlink"
  desc "Winlink email client with CAT rig control and VARA, ARDOP, and packet transports"
  homepage "https://github.com/jjones9527/macwinlink-releases"

  livecheck do
    url :url
    regex(/^MacWinlink[._-](\d{4}-\d{2}-\d{2})[._-](\h+)\.dmg$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"]

        tag = release["tag_name"]&.delete_prefix("v")
        next if tag.blank?

        asset = release["assets"]&.find { |item| item["name"]&.match?(regex) }
        next if asset.nil?

        match = asset["name"].match(regex)
        "#{tag},#{match[1]},#{match[2]}"
      end
    end
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "MacWinlink.app"
  app "MacWinlink Helper.app"

  zap trash: [
    "~/Library/Containers/Home.MacWinlink",
    "~/Library/Preferences/com.arsfi.macwinlink-helper.plist",
    "~/Library/Saved Application State/com.arsfi.macwinlink-helper.savedState",
  ]

  caveats <<~EOS
    MacWinlink Helper.app is also installed; it is only needed for the
    VARA HF/FM and Direwolf packet transports.

    The bundles are only ad-hoc signed and not notarised while upstream
    completes Apple Developer Program enrolment, so Gatekeeper will block
    them on first launch. On macOS 15 right-click "Open" no longer
    bypasses this: launch the app, dismiss the warning, then allow it in
    System Settings → Privacy & Security → "Open Anyway" (repeat for
    MacWinlink Helper on first use). Alternatively, run:

      xattr -r -d com.apple.quarantine /Applications/MacWinlink.app
      xattr -r -d com.apple.quarantine "/Applications/MacWinlink Helper.app"
  EOS
end
