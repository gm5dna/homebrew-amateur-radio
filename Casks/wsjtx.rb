cask "wsjtx" do
    version "2.7.0"
    sha256 "f3ef11f3612f1db7bcdea55e5a4ce409b0c1db43ae6bc1a5e048fc99833e031e"
  
    url "https://netcologne.dl.sourceforge.net/project/wsjt/wsjtx-#{version}/wsjtx-#{version}-Darwin.dmg",
        verified: "sourceforge.net/project/wsjt/"
    name "WSJT-X"
    desc "Software for weak-signal digital communication"
    homepage "https://physics.princeton.edu/pulsar/k1jt/wsjtx.html"
  
    app "WSJT-X.app"
  
    zap trash: [
      "~/Library/Application Support/WSJT-X",
      "~/Library/Preferences/org.wsjtx.WSJTX.plist",
      "~/Library/Saved Application State/org.wsjtx.WSJTX.savedState",
    ]
  end
  