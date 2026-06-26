cask "wfview" do
  version "2.24,1811"
  sha256 "007374a95db0773ed0f56533965cffafef67a5a40dd317971b9283d3f0cc9882"

  url "https://wfview.org/download/macos-universal-v#{version.csv.first.dots_to_hyphens}/?wpdmdl=#{version.csv.second}"
  name "wfview"
  desc "Open source interface for Icom and Kenwood transceivers"
  homepage "https://wfview.org/"

  livecheck do
    url "https://wfview.org/download/"
    regex(%r{macos-universal-v([\d-]+)/\?wpdmdl=(\d+)}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0].tr("-", ".")},#{match[1]}" }
    end
  end

  # Upstream's download page states the v2 universal binary needs macOS 13+.
  # The 2.24 binary's Info.plist mislabels LSMinimumSystemVersion as 12.0, so
  # `brew audit --online` warns about a monterey/ventura mismatch; ignore it.
  depends_on macos: :ventura

  app "wfview.app"

  zap trash: [
    "~/Library/Preferences/org.wfview.wfview.plist",
    "~/Library/Saved Application State/org.wfview.wfview.savedState",
  ]
end
