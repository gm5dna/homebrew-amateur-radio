cask "jlog-amateur-radio" do
  version "6.15"

  on_arm do
    sha256 "a3b62e504f53fbbddbba7159a1fc54b7a90a1c7ec8ac37eae2809f297989c730"

    url "https://jlog.org/v#{version.major_minor}/jLog-#{version}-M.dmg"
  end
  on_intel do
    sha256 "5f73caa1e5a99a673f415beef471709049a7fe9ced649f3c284b8422cb72c049"

    url "https://jlog.org/v#{version.major_minor}/jLog-#{version}.dmg"
  end

  name "jLog"
  desc "Cross-platform amateur radio logger with LoTW, eQSL, and ClubLog integration"
  homepage "https://jlog.org/"

  livecheck do
    url :homepage
    regex(/jLog\s*V\s*(\d+(?:\.\d+)+)/i)
  end

  depends_on macos: :big_sur

  app "jLog.app"

  zap trash: [
    "~/jLog",
    "~/Library/Preferences/org.jlog.plist",
    "~/Library/Saved Application State/org.jlog.savedState",
  ]
end
