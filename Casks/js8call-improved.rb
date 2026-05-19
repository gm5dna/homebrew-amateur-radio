cask "js8call-improved" do
  version "3.0.1"

  on_arm do
    sha256 "40df7438be667b5cfd07e76c923f77800c722851096367f6f9a4c79f1ec24e9e"

    url "https://github.com/JS8Call-improved/JS8Call-improved/releases/download/v#{version}/JS8Call_#{version}_M1.dmg"
  end
  on_intel do
    sha256 "a851f591085583f26ab9989e4177ebb41ca0619f5abac9159f37c907fc66cb00"

    url "https://github.com/JS8Call-improved/JS8Call-improved/releases/download/v#{version}/JS8Call_#{version}_Intel.dmg"
  end

  name "JS8Call Improved"
  desc "Improved version of JS8Call for weak-signal amateur radio communication"
  homepage "https://github.com/JS8Call-improved/JS8Call-improved"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: :monterey

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
