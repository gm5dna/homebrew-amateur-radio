cask "hamrs" do
  version "2.52.1"

  on_arm do
    sha256 "a27f30dde6867c17c5a4079e071da7509d86cad5476d8028742aa0d95084d751"

    url "https://hamrs-dist.s3.amazonaws.com/hamrs-pro-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "1180b8c24091193b6b6aca4c763ec35acaaaf87b3d88c72608d507baa5e5ac4a"

    url "https://hamrs-dist.s3.amazonaws.com/hamrs-pro-#{version}-mac-x64.dmg"
  end

  name "HAMRS Pro"
  desc "Portable amateur radio logger for Parks on the Air, Field Day, and SOTA"
  homepage "https://www.hamrs.app/"

  livecheck do
    url "https://www.hamrs.app/"
    regex(/hamrs[._-]pro[._-]v?(\d+(?:\.\d+)+)/i)
  end

  depends_on :macos

  app "HAMRS Pro.app"

  zap trash: [
    "~/Library/Application Support/HAMRS Pro",
    "~/Library/Preferences/com.hamrs.pro.plist",
    "~/Library/Saved Application State/com.hamrs.pro.savedState",
  ]
end
