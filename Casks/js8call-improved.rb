cask "js8call-improved" do
  version "3.0.3"
  sha256 "9a86f5c154ca3f2bdf18f42c61d1055aca5690973488cfc7d974ea918d9853cc"

  url "https://github.com/JS8Call-improved/JS8Call-improved/releases/download/v#{version}/JS8Call_#{version}.dmg"
  name "JS8Call Improved"
  desc "Improved version of JS8Call for weak-signal amateur radio communication"
  homepage "https://github.com/JS8Call-improved/JS8Call-improved"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "JS8Call.app", target: "JS8Call-improved.app"

  # No zap stanza: the app uses the same bundle id (org.kn4crd.js8call) and
  # configuration paths as the base js8call cask, so zapping this cask would
  # destroy the official app's settings. `brew uninstall --zap js8call`
  # removes the shared data.

  caveats <<~EOS
    JS8Call-improved shares its configuration
    (~/Library/Application Support/JS8Call and JS8Call.ini) with JS8Call,
    and it is left in place on uninstall; "brew uninstall --zap js8call"
    removes it.

    Settings from JS8Call v2.3.x are compatible, but v2.2.x settings
    may cause issues. Back up your JS8Call.ini before upgrading.
  EOS
end
