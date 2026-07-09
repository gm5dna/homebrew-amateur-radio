cask "flcluster" do
  version "1.1.01"
  sha256 "72acdeb07db3a6dc9cb3e5f8d8e6ef9d08026ca11c553dd7e960cee9613dc116"

  url "https://www.w1hkj.org/files/flcluster/flcluster-#{version}.dmg"
  name "flcluster"
  desc "DX telnet cluster client for the fldigi suite"
  homepage "https://www.w1hkj.org/"

  livecheck do
    url "https://www.w1hkj.org/files/flcluster/"
    regex(/flcluster-(\d+(?:\.\d+)+)\.dmg/i)
  end

  depends_on :macos

  app "flcluster-#{version}.app", target: "flcluster.app"

  zap trash: [
    "~/.flcluster",
    "~/Library/Preferences/com.w1hkj.flcluster.plist",
    "~/Library/Saved Application State/com.w1hkj.flcluster.savedState",
  ]
end
