cask "tx500-utility" do
  version "0.9.0"
  sha256 "56a8ec7331430d0ec55bc20fd6b83c1edf368d87ec12a6554040b71d80fb5761"

  url "https://github.com/mikeg-dal/TX500Utility/releases/download/v#{version}/TX500Utility-#{version}-macos.dmg"
  name "TX500 Utility"
  desc "CAT control, memories, backups and firmware updates for the Lab599 TX-500"
  homepage "https://mikeg-dal.github.io/TX500Utility/"

  livecheck do
    url "https://mikeg-dal.github.io/TX500Utility/releases.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "TX500 Utility.app"

  # ~/Library/Application Support/TX500 Utility/Backups (radio settings
  # backups) is deliberately not zapped.
  zap trash: [
    "~/Library/Preferences/com.kf5o.tx500utility.plist",
    "~/Library/Saved Application State/com.kf5o.tx500utility.savedState",
  ]
end
