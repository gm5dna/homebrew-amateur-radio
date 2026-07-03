cask "sstv" do
  version "2.5.1"
  sha256 :no_check

  url "https://www.blackcatsystems.com/download/SSTV_app.zip",
      user_agent: :fake
  name "Black Cat SSTV"
  desc "Slow-scan television (SSTV) encoder and decoder for amateur radio"
  homepage "https://www.blackcatsystems.com/software/sstv.html"

  livecheck do
    url :homepage
    regex(/SSTV version\s*(\d+(?:\.\d+)+)\s+for macOS/i)
    strategy :page_match do |page, regex|
      match = page.match(regex)
      match ? [match[1]] : []
    end
  end

  depends_on :macos

  app "SSTV_app/Black Cat SSTV.app"

  zap trash: [
    "~/Library/Application Support/Black Cat SSTV",
    "~/Library/Preferences/com.blackcatsystems.sstv.plist",
    "~/Library/Saved Application State/com.blackcatsystems.sstv.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
