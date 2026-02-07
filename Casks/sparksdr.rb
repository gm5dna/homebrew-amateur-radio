cask "sparksdr" do
  version "2.0.991"

  on_arm do
    sha256 "74bc7c29e3146834e7276a1a8670660439442f0b7e3d7615123741524ca5c4cd"

    url "https://www.sparksdr.com/download/SparkSDR.#{version}.osx.arm.zip"
  end
  on_intel do
    sha256 "5f567e6d31676cafa64378d566afc21afaa388869998b2336c74588016c9ff4b"

    url "https://www.sparksdr.com/download/SparkSDR.#{version}.osx.zip"
  end

  name "SparkSDR"
  desc "SDR application for Hermes Lite and OpenHPSDR-compatible radios"
  homepage "https://www.sparksdr.com/"

  livecheck do
    url "https://www.sparksdr.com/downloads"
    regex(/SparkSDR[._-]v?(\d+(?:\.\d+)+)\.osx\.arm\.zip/i)
  end

  depends_on macos: ">= :big_sur"

  app "SparkSDR.app"

  zap trash: [
    "~/Library/Application Support/SparkSDR",
    "~/Library/Preferences/com.sparksdr.plist",
    "~/Library/Saved Application State/com.sparksdr.savedState",
  ]
end
