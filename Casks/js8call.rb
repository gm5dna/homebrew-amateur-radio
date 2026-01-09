cask "js8call" do
  version "2.3.1"
  sha256 "7a1c1509a59e3ac2a5fffb6947f79e493fb24fe4c9e113a7fd4bf2bf6b0b7fbe"

  url "https://files.js8call.com/#{version}/js8call-#{version}-Darwin.dmg"
  name "JS8Call"
  desc "Weak signal amateur radio software"
  homepage "https://js8call.com/"

  livecheck do
    url "https://files.js8call.com/"
    regex(/href=.*?v?(\d+(?:\.\d+)+)/i)
  end

  app "JS8Call.app"

  zap trash: [
    "~/Library/Application Support/JS8Call",
    "~/Library/Preferences/com.js8call.plist",
    "~/Library/Saved Application State/com.js8call.savedState",
  ]
end
