cask "hf-autopilot" do
  version "0.93"
  sha256 :no_check

  url "https://w0xz.com/autopilot/Installer.dmg"
  name "HF Autopilot"
  desc "Quick tuning to POTA, SOTA, and NetLogger HF spots for HF radios"
  homepage "https://w0xz.com/autopilot/"

  livecheck do
    url "https://w0xz.com/v/autopilot/"
    regex(/v(\d+(?:\.\d+)+)/i)
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
