cask "hamrs" do
  version "2.52.0"

  on_arm do
    sha256 "33c268849918d54e4d4070a2320f36a4f8521ff6dfd476a1fbd8f27bd3fc1331"

    url "https://hamrs-dist.s3.amazonaws.com/hamrs-pro-#{version}-mac-arm64.dmg",
        verified: "hamrs-dist.s3.amazonaws.com"
  end
  on_intel do
    sha256 "1d01acff971cd36fb516977aa02efba1ffbd61e8cf97908f1be6508e087789d2"

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
