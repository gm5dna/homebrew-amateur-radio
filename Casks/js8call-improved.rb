cask "js8call-improved" do
  version "2.4.0"

  on_arm do
    sha256 "616f7736bd0bc3b1d8c4dab3e35f83068307321a76bebb453470f3c6fa58de7e"
    url "https://github.com/JS8Call-improved/JS8Call-improved/releases/download/release/#{version}/JS8Call-improved_#{version}_arm64.dmg"
  end

  on_intel do
    sha256 "432277960d5b7d7a7650e774b78680557bab50f6f10f01b7ade5e29aa410098c"
    url "https://github.com/JS8Call-improved/JS8Call-improved/releases/download/release/#{version}/JS8Call-improved_#{version}_universal.dmg"
  end

  name "JS8Call Improved"
  desc "Improved version of JS8Call for weak-signal amateur radio communication"
  homepage "https://github.com/JS8Call-improved/JS8Call-improved"

  depends_on macos: ">= :monterey"

  livecheck do
    url :homepage
    strategy :github_latest
    regex(%r{release/(\d+(?:\.\d+)+)})
  end

  app "JS8Call-improved.app"

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
