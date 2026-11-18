cask "hamrs" do
  version "2.53.0"

  on_arm do
    sha256 "122be163c81acc7157b2f6b6238f6dfed37be9f9be5a8308d7f1fb5285a5f9c8"

    url "https://hamrs-dist.s3.amazonaws.com/hamrs-pro-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "7a470589be161dec6a81481817881df5ee5395a3e2fc2dac89e75e76f4efaaa7"

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

  # ~/Library/Application Support/HAMRS Pro is deliberately not zapped: it is
  # the app's Electron data folder, which holds the local logbooks.
  zap trash: [
    "~/Library/Preferences/app.hamrs.pro.plist",
    "~/Library/Saved Application State/app.hamrs.pro.savedState",
  ]
end
