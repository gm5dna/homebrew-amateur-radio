cask "ftdx10-cockpit" do
  version "1.2"
  sha256 :no_check

  url "https://w0xz.com/ftdx10/Installer.dmg"
  name "FTdx10 Utility"
  desc "Controller software for the Yaesu FTdx10 transceiver"
  homepage "https://w0xz.com/ftdx10/"

  livecheck do
    url :homepage
    regex(/version\s*(\d+(?:\.\d+)+)/i)
  end

  depends_on cask: "silicon-labs-vcp-driver"

  app "FTDX10 Cockpit.app"

  zap trash: [
    "~/Library/Application Support/FTDX10 Cockpit",
    "~/Library/Preferences/com.w0xz.FTDX10Cockpit.plist",
    "~/Library/Saved Application State/com.w0xz.FTDX10Cockpit.savedState",
  ]
end
