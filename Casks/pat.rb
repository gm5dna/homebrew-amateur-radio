cask "pat" do
  version "0.19.2"
  sha256 "0b6d82c3d4ea6216e51a6a32f8034e91bfb0bd0c9f5ab4327088104cda6206c2"

  url "https://github.com/la5nta/pat/releases/download/v#{version}/pat_#{version}_darwin_amd64.pkg"
  name "Pat"
  desc "Cross-platform Winlink client for amateur radio"
  homepage "https://github.com/la5nta/pat"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  pkg "pat_#{version}_darwin_amd64.pkg"

  uninstall pkgutil: "com.github.la5nta.pat"

  zap trash: [
    "~/.config/pat",
    "~/.local/share/pat",
  ]

  caveats <<~EOS
    Pat is built for Intel (x86_64) only. On Apple Silicon Macs, it runs via Rosetta 2.
  EOS
end
