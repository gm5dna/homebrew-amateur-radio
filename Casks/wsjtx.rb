cask "wsjtx" do
  version "2.7.0"
  sha256 "f3ef11f3612f1db7bcdea55e5a4ce409b0c1db43ae6bc1a5e048fc99833e031e"

  url "https://downloads.sourceforge.net/wsjt/wsjtx-#{version}/wsjtx-#{version}-Darwin.dmg",
      verified: "downloads.sourceforge.net/wsjt/"
  name "WSJT-X"
  desc "Weak-signal digital communication using FT8, FT4, JT65, and WSPR modes"
  homepage "https://physics.princeton.edu/pulsar/k1jt/wsjtx.html"

  livecheck do
    url "https://sourceforge.net/projects/wsjt/files/wsjtx/"
    regex(%r{href=.*?/wsjtx[._-]v?(\d+(?:\.\d+)+)/?["' >]}i)
    strategy :page_match
  end

  app "wsjtx.app"

  zap trash: [
    "~/Library/Application Support/WSJT-X",
    "~/Library/Preferences/org.wsjtx.WSJTX.plist",
    "~/Library/Saved Application State/org.wsjtx.WSJTX.savedState",
  ]
end
