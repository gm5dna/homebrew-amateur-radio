cask "ft710-cockpit" do
  version "1.2"
  sha256 "8d348ac9d228d4a7810c4f041a0f4893f15d92d29673f8a394a248abbc74f626"

  url "https://w0xz.com/ft-710/Installer.dmg"
  name "FT-710 Cockpit"
  desc "Controller software for the Yaesu FT-710 transceiver"
  homepage "https://w0xz.com/ft-710/"

  livecheck do
    url "https://w0xz.com/v/ft-710/"
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :page_match
  end

  depends_on macos: ">= :monterey"
  depends_on cask: "silicon-labs-vcp-driver"

  app "FT-710 Cockpit.app"

  zap trash: [
    "~/Library/Application Support/FT-710 Cockpit",
    "~/Library/Preferences/com.w0xz.FT710Cockpit.plist",
    "~/Library/Saved Application State/com.w0xz.FT710Cockpit.savedState",
  ]
end
