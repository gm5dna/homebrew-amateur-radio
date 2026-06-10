cask "js8call-improved" do
  version "3.0.2"

  on_arm do
    sha256 "a7f974c39949e3142f8262d22b887ccd25df3ed17fc41734fb0980a5707858fe"

    url "https://github.com/JS8Call-improved/JS8Call-improved/releases/download/v#{version}/JS8Call_#{version}_M1.dmg"
  end
  on_intel do
    sha256 "09479bc5f97f0266dff3ee0ef35dce39d393eb45cb744ce874db0dc0392bdc4e"

    url "https://github.com/JS8Call-improved/JS8Call-improved/releases/download/v#{version}/JS8Call_#{version}_Intel.dmg"
  end

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
