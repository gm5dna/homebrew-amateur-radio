cask "rumlogng" do
  version "5.19.1"
  sha256 :no_check

  url "https://dl2rum.de/RUMlogNG/RUMlogNG.zip"
  name "RUMlogNG"
  desc "Amateur radio logging software by DL2RUM"
  homepage "https://dl2rum.de/"

  livecheck do
    url :homepage
    regex(/RUMlogNG[._-]v?(\d+(?:\.\d+)+)/i)
  end

  app "RUMlogNG.app"

  zap trash: [
    "~/Library/Application Support/RUMlogNG",
    "~/Library/Preferences/de.dl2rum.RUMlogNG.plist",
    "~/Library/Saved Application State/de.dl2rum.RUMlogNG.savedState",
  ]
end
