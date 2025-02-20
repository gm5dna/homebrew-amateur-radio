cask "wsjtz" do
  version "2.6.1-1.3.3"
  sha256 "0a317721710aa83ac4d3dc602bbfbf40540024c586802a6aba572f3758fe1127"

  url "https://downloads.sourceforge.net/wsjt-z/wsjtz-#{version}-Darwin.dmg",
      verified: "downloads.sourceforge.net/wsjt-z/"
  name "WSJT-Z"
  desc "Weak-signal digital communication software with automation features"
  homepage "https://physics.princeton.edu/pulsar/k1jt/wsjtx.html"

  app "wsjtx.app", target: "wsjtz.app"
end
