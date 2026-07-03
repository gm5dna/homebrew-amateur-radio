cask "macdoppler" do
  version "2.48"
  sha256 "aa646fa343e152724f79f87e292c742a547532c5dd01a733012c92f949601641"

  url "https://www.dogparksoftware.com/files/MacDoppler#{version.no_dots}.dmg"
  name "MacDoppler"
  desc "Satellite tracking, Doppler tuning and rotator automation for amateur radio"
  homepage "https://www.dogparksoftware.com/MacDoppler.html"

  livecheck do
    url :homepage
    regex(/Download\s+v?(\d+(?:\.\d+)+)/i)
  end

  depends_on macos: :catalina

  app "MacDoppler.app"

  zap trash: [
    "~/Library/Caches/com.dogparksoftware.MacDoppler",
    "~/Library/HTTPStorages/com.dogparksoftware.MacDoppler",
    "~/Library/Preferences/com.dogparksoftware.MacDoppler*.plist",
    "~/Library/Saved Application State/com.dogparksoftware.MacDoppler.savedState",
  ]
end
