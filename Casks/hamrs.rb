cask "hamrs" do
  version "2.51.0"

  on_arm do
    sha256 "823ce561962bb71d1ae235de05d8d0683c3240ffa331033beb70c42e82d1eeb8"

    url "https://hamrs-dist.s3.amazonaws.com/hamrs-pro-#{version}-mac-arm64.dmg",
        verified: "hamrs-dist.s3.amazonaws.com"
  end
  on_intel do
    sha256 "07b2d1f70940f2c989081c144ef340999282d7e60c4f50a26659c89c52479b94"

    url "https://hamrs-dist.s3.amazonaws.com/hamrs-pro-#{version}-mac-x64.dmg",
        verified: "hamrs-dist.s3.amazonaws.com"
  end

  name "HAMRS Pro"
  desc "Portable amateur radio logger for Parks on the Air, Field Day, and SOTA"
  homepage "https://www.hamrs.app/"

  livecheck do
    url "https://www.hamrs.app/"
    regex(/hamrs[._-]pro[._-]v?(\d+(?:\.\d+)+)/i)
  end

  depends_on macos: :big_sur

  app "HAMRS Pro.app"

  zap trash: [
    "~/Library/Application Support/HAMRS Pro",
    "~/Library/Preferences/com.hamrs.pro.plist",
    "~/Library/Saved Application State/com.hamrs.pro.savedState",
  ]
end
