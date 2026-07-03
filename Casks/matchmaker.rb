cask "matchmaker" do
  version "2.0.0"
  sha256 :no_check

  url "https://www.blackcatsystems.com/download/MatchMakerOSX.zip",
      user_agent: :fake
  name "RF MatchMaker"
  desc "RF impedance-matching network calculator"
  homepage "https://www.blackcatsystems.com/software/matchmaker-rf-impedance-matching-software.html"

  livecheck do
    url :homepage
    regex(/MatchMaker\s+(\d+(?:\.\d+)+)\s+for/i)
  end

  depends_on :macos

  app "MatchMaker OSX/RF MatchMaker.app"

  zap trash: [
    "~/Library/Application Support/RF MatchMaker",
    "~/Library/Preferences/com.blackcatsystems.MatchMaker.plist",
    "~/Library/Saved Application State/com.blackcatsystems.MatchMaker.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
