cask "js8call" do
  version "2.3.1"
  sha256 "4f364e7b94af49bceaf554169d710fa0d464b4ee9f43d72120387c258c7975a9"

  url "https://github.com/js8call/js8call/releases/download/v#{version}/JS8Call_#{version}.dmg"
  name "JS8Call"
  desc "Weak-signal keyboard-to-keyboard messaging built on FT8"
  homepage "https://js8call.com/"

  livecheck do
    url "https://github.com/js8call/js8call/releases/latest"
    strategy :github_latest
  end

  app "JS8Call.app"

  zap trash: [
    "~/Library/Application Support/JS8Call",
    "~/Library/Preferences/com.js8call.plist",
    "~/Library/Saved Application State/com.js8call.savedState",
  ]
end
