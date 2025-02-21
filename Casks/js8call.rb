cask "js8call" do
  version "2.2.0"
  sha256 "34fe1b68757bd9ddd3905b443b6d23776b18c5a803944d49a2e3ebf3327c9b9b"

  url "http://files.js8call.com/#{version}/js8call-#{version}-Darwin.dmg"
  name "JS8Call"
  homepage "https://js8call.com/"
  desc "Weak signal amateur radio software"

  app "JS8Call.app"

  # zap trash: [
  #   "~/Library/Application Support/JS8Call",
  #   "~/Library/Preferences/com.js8call.plist",
  # ]
end
