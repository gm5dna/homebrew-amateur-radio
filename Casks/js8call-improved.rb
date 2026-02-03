cask "js8call-improved" do
  version "2.5.2"

  on_arm do
    sha256 "9755fd3d37ba90e3f6733b510195ebb3d7aea378e150271db5bedcd25d0e6543"

    url "https://github.com/JS8Call-improved/JS8Call-improved/releases/download/release/#{version}/JS8Call_#{version}_arm64.dmg"
  end
  on_intel do
    sha256 "14b44d849da0f75e3221800fc4b5cef640335c45cfe5f9b3c85e9c0264755d8f"

    url "https://github.com/JS8Call-improved/JS8Call-improved/releases/download/release/#{version}/JS8Call_#{version}_universal.dmg"
  end

  name "JS8Call Improved"
  desc "Improved version of JS8Call for weak-signal amateur radio communication"
  homepage "https://github.com/JS8Call-improved/JS8Call-improved"

  livecheck do
    url :homepage
    strategy :github_latest
    regex(%r{release/(\d+(?:\.\d+)+)})
  end

  depends_on macos: ">= :monterey"

  app "JS8Call.app", target: "JS8Call-improved.app"

  zap trash: [
    "~/Library/Application Support/JS8Call",
    "~/Library/Preferences/JS8Call.ini",
    "~/Library/Saved Application State/JS8Call.savedState",
  ]

  caveats <<~EOS
    JS8Call-improved uses Qt 6.9.3 with FFmpeg audio backend.

    On macOS, ensure you have the latest security updates installed.

    Settings from JS8Call v2.3.x are compatible, but v2.2.x settings
    may cause issues. Back up your JS8Call.ini before upgrading.
  EOS
end
