cask "sstv-beta" do
  version "3.0.0b1"
  sha256 :no_check

  url "https://www.blackcatsystems.com/download/sstvbeta.zip",
      user_agent: :fake
  name "Black Cat SSTV (beta)"
  desc "Slow-scan television encoder and decoder for amateur radio (universal beta)"
  homepage "https://www.blackcatsystems.com/software/sstv.html"

  livecheck do
    url :homepage
    regex(/SSTV version\s*(\d+(?:\.\d+)+b\d+)\s+for macOS/i)
  end

  conflicts_with cask: "gm5dna/amateur-radio/sstv"
  depends_on :macos

  app "SSTV_app/Black Cat SSTV.app"

  zap trash: [
    "~/Library/Application Support/Black Cat SSTV",
    "~/Library/Preferences/com.blackcatsystems.sstv.plist",
    "~/Library/Saved Application State/com.blackcatsystems.sstv.savedState",
  ]
end
