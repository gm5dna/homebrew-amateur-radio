cask "freedv" do
  version "2.0.0-20250130"
  sha256 "da63320c1b65342981c58b36118b752845afbc4dacec0197125650686578884c"

  url "https://github.com/drowe67/freedv-gui/releases/download/v#{version}/FreeDV.dmg",
      verified: "github.com/drowe67/freedv-gui/"
  name "FreeDV"
  desc "Open-source digital voice for HF radio"
  homepage "https://freedv.org/"

  app "FreeDV.app"

  zap trash: [
    "~/Library/Application Support/FreeDV",
    "~/Library/Preferences/org.freedv.FreeDV.plist",
  ]
end
