cask "wsjtx" do
  version "3.0.0"
  sha256 "8cf5ce27d21490c24eedf91e0ac2bc4a748ba8f4eb20cb7c1fc9442d2d580008"

  url "https://downloads.sourceforge.net/wsjt/wsjtx-#{version}/wsjtx-#{version}-Darwin.dmg",
      verified: "downloads.sourceforge.net/wsjt/"
  name "WSJT-X"
  desc "Software for weak-signal digital communication"
  homepage "https://physics.princeton.edu/pulsar/k1jt/wsjtx.html"

  livecheck do
    url "https://sourceforge.net/projects/wsjt/files/wsjtx/"
    regex(/wsjtx[._-]v?(\d+(?:\.\d+)+)/i)
  end

  app "wsjtx.app"

  zap trash: [
    "~/Library/Application Support/WSJT-X",
    "~/Library/Preferences/org.wsjtx.WSJTX.plist",
    "~/Library/Saved Application State/org.wsjtx.WSJTX.savedState",
  ]
end
