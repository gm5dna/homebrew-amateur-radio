cask "aether" do
  version "1.6.10,1716"
  sha256 :no_check

  url "https://builds.openreelsoftware.com/apps/aether/release/download/latest_dmg",
      verified: "builds.openreelsoftware.com/apps/aether/"
  name "Aether"
  desc "Ham radio logger with rig control, awards tracking, and QSL management"
  homepage "https://www.aetherlog.com/"

  livecheck do
    url "https://builds.openreelsoftware.com/apps/aether/release/release-notes/latest"
    regex(/Aether\s+v?(\d+(?:\.\d+)+)\s+\((\d+)\)/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0]},#{match[1]}" }
    end
  end

  app "Aether.app"

  zap trash: [
    "~/Library/Application Support/Aether",
    "~/Library/Caches/com.openreelsoftware.Aether",
    "~/Library/Preferences/com.openreelsoftware.Aether.plist",
    "~/Library/Saved Application State/com.openreelsoftware.Aether.savedState",
  ]
end
