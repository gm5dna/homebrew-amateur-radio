cask "hf-autopilot" do
  version "0.93"
  sha256 "9f6cd6f5c5f8ea664584681efaee8e1ebf3b2179d326df01762ad5a901217789"

  url "https://w0xz.com/autopilot/Installer.dmg"
  name "HF Autopilot"
  desc "Quick tuning to POTA, SOTA, and NetLogger HF spots for Elecraft, Icom, Kenwood, and Yaesu"
  homepage "https://w0xz.com/autopilot/"

  livecheck do
    url "https://w0xz.com/v/autopilot/"
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :page_match
  end

  depends_on macos: ">= :monterey"

  app "HF Autopilot.app"

  zap trash: [
    "~/Library/Application Support/HF Autopilot",
    "~/Library/Preferences/com.W0XZ.HFAutopilot.plist",
    "~/Library/Saved Application State/com.W0XZ.HFAutopilot.savedState",
  ]
end
