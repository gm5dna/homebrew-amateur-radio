cask "spectraflux" do
  version :latest
  sha256 :no_check

  url "https://rfspace.com/RFSPACE/SpectraFlux/SpectraFlux.zip"
  name "SpectraFlux"
  desc "SDR spectrum analyser with 3D waterfall, demodulation, and ADS-B decoding"
  homepage "https://rfspace.com/RFSPACE/SpectraFlux/"

  livecheck do
    skip "No version in the download URL or on the download page"
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "SpectraFlux.app"

  zap trash: [
    "~/Library/Application Support/SpectraFlux",
    "~/Library/Preferences/com.pieter.SpectraFlux.plist",
    "~/Library/Saved Application State/com.pieter.SpectraFlux.savedState",
  ]

  caveats <<~EOS
    SpectraFlux is a beta build that stops launching 30 days after its build
    date. When it expires, fetch the current build with:
      brew reinstall --cask spectraflux
  EOS
end
