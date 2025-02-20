cask "ftdx10-cockpit" do
  version "1.12"
  sha256 :no_check

  url "https://w0xz.com/ftdx10/Installer.dmg"
  name "FTdx10 Utility"
  desc "Controller software for the Yaesu FTdx10 transceiver"
  homepage "https://w0xz.com/ftdx10/"

  depends_on cask: "silicon-labs-vcp-driver"

  app "FTDX10 Cockpit.app"
end
