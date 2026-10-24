cask "aethersdr" do
  version "26.10.3"
  sha256 "afd05a086acbd3f99af91b4e06245f8008e0a7b66a7b37384669a8ee206eec82"

  url "https://github.com/aethersdr/AetherSDR/releases/download/v#{version}/AetherSDR-v#{version}-macOS-apple-silicon.dmg"
  name "AetherSDR"
  desc "Client for FlexRadio 6000, 8000 and Aurora transceivers"
  homepage "https://www.aethersdr.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "AetherSDR.app"

  # ~/Documents/AetherSDR/Recordings (QSO recordings) is deliberately not
  # zapped.
  zap trash: [
    "~/Library/Preferences/AetherSDR",
    "~/Library/Preferences/com.aethersdr.AetherSDR.plist",
    "~/Library/Saved Application State/com.aethersdr.AetherSDR.savedState",
  ]

  caveats <<~EOS
    The optional DAX virtual audio drivers ship as a separate installer in
    the same DMG and are not installed by this cask. To use them, download
    the DMG from https://github.com/aethersdr/AetherSDR/releases and run
    "AetherSDR DAX Drivers.pkg".
  EOS
end
