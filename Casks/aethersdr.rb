cask "aethersdr" do
  arch arm: "apple-silicon", intel: "intel"

  version "26.11.3"
  sha256 arm:   "83e455efcbae4e9f0adf9f9c0ca98f9f6d84ff2ff906438f80131fdab148a742",
         intel: "1027e69c176541944fc572e5f55cffda2db6a2b5890b88ad70fe670af37c75d1"

  url "https://github.com/aethersdr/AetherSDR/releases/download/v#{version}/AetherSDR-v#{version}-macOS-#{arch}.dmg"
  name "AetherSDR"
  desc "Client for FlexRadio 6000, 8000 and Aurora transceivers"
  homepage "https://www.aethersdr.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
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
