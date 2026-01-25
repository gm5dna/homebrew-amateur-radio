cask "skookumlogger" do
  version "5.4"
  sha256 :no_check

  url "https://www.k1gq.net/SkookumLoggerDownloads/SkookumLoggerLatestBeta.zip"
  name "SkookumLogger"
  desc "Contest logging software by K1GQ"
  homepage "https://www.k1gq.net/SkookumLogger/"

  livecheck do
    url "https://www.k1gq.net/SkookumLoggerDownloads/"
    regex(/Release\s+(\d+(?:\.\d+)+)/i)
  end

  app "SkookumLogger.app"

  zap trash: [
    "~/Library/Application Support/SkookumLogger",
    "~/Library/Preferences/net.k1gq.SkookumLogger.plist",
    "~/Library/Saved Application State/net.k1gq.SkookumLogger.savedState",
  ]
end
