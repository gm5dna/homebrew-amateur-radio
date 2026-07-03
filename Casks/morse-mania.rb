cask "morse-mania" do
  version "5.0.1"
  sha256 :no_check

  url "https://www.blackcatsystems.com/download/MorseManiaOSX.dmg",
      user_agent: :fake
  name "Morse Mania"
  desc "CW (Morse code) training and practice tutor"
  homepage "https://www.blackcatsystems.com/software/morse-code-practice-software.html"

  livecheck do
    url :homepage
    regex(/Morse Mania is\s+(\d+(?:\.\d+)+)/i)
  end

  depends_on :macos

  app "Morse Mania.app"

  zap trash: [
    "~/Library/Application Support/Morse Mania",
    "~/Library/Preferences/com.blackcatsystems.morsemania.plist",
    "~/Library/Saved Application State/com.blackcatsystems.morsemania.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
