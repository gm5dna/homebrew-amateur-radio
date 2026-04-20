cask "pat" do
  version "1.0.0"
  sha256 "cd7af751ee52536abfb3881375dd42e4f29906a2a543976fcc6a8d9a77d6e484"

  url "https://github.com/la5nta/pat/releases/download/v#{version}/pat_#{version}_darwin_amd64.pkg"
  name "Pat"
  desc "Cross-platform Winlink client for amateur radio"
  homepage "https://github.com/la5nta/pat"

  livecheck do
    url "https://github.com/la5nta/pat/releases"
    regex(%r{href=["']?[^"' >]*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
    strategy :page_match
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
