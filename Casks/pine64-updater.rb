cask "pine64-updater" do
  version "1.0.3"
  sha256 "2b5319fb04b5113f1172f5df12485f1a18fe3423c8c98f7869ef8dd86e5392c4"

  url "https://github.com/pine64/pine64_updater/releases/download/#{version}/pine64_updater_macos64_#{version}.dmg"
  name "Pine64 Updater"
  desc "Updater tool for Pine64 devices such as the Pinecil"
  homepage "https://github.com/pine64/pine64_updater"

  app "PINE64 Updater.app"

  zap trash: [
    "~/Library/Application Support/pine64_updater",
    "~/Library/Preferences/com.pine64.updater.plist",
    "~/Library/Saved Application State/com.pine64.updater.savedState",
  ]
end
