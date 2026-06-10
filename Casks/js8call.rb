cask "js8call" do
  version "2.3.1"
  sha256 "4f364e7b94af49bceaf554169d710fa0d464b4ee9f43d72120387c258c7975a9"

  url "https://github.com/js8call/js8call/releases/download/v#{version}/JS8Call_#{version}.dmg"
  name "JS8Call"
  desc "Weak-signal keyboard-to-keyboard messaging built on FT8"
  # js8call.com now serves the JS8Call-improved fork's site, not this project.
  homepage "https://github.com/js8call/js8call"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "JS8Call.app"

  zap trash: [
    "~/Library/Application Support/JS8Call",
    "~/Library/Preferences/JS8Call.ini",
    "~/Library/Preferences/org.kn4crd.js8call.plist",
    "~/Library/Saved Application State/org.kn4crd.js8call.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
