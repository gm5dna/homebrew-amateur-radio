cask "aethersdr" do
  arch arm: "apple-silicon", intel: "intel"

  version "26.11.4"
  sha256 arm:   "d3678d421871c8415609940c2ebf6b0135aecfb95db5472cf5b72cae9837e5fa",
         intel: "0ed7da16d4be548aca3bfd82a7f38db606c806d08e9912a26f4ca5bc5d07cbe5"

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
