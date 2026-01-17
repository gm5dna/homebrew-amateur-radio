cask "jlog" do
  version "6.14.1"

  on_arm do
    sha256 "49b4e068ecb62002b1c666f9008e0266467af3fafc3c8b739a975bdfbbc823db"

    url "https://jlog.org/v#{version.major_minor}/jLog-#{version}-M.dmg"

    depends_on macos: ">= :big_sur"
  end
  on_intel do
    sha256 "48bfd867ac47b719e986617abb49fd889169ce58dc1baada484c6cbcfd14dc34"

    url "https://jlog.org/v#{version.major_minor}/jLog-#{version}.dmg"

    depends_on macos: ">= :sierra"
  end

  name "jLog"
  desc "Cross-platform amateur radio logger with LoTW, eQSL, and ClubLog integration"
  homepage "https://jlog.org/"

  livecheck do
    url :homepage
    regex(/jLog\s*V\s*(\d+(?:\.\d+)+)/i)
  end

  app "jLog.app"

  zap trash: [
    "~/jLog",
    "~/Library/Preferences/org.jlog.plist",
    "~/Library/Saved Application State/org.jlog.savedState",
  ]
end
