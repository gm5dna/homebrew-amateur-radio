cask "wfview" do
  version "2.22,1788"
  sha256 "68f5ecc8ffe7eecf426397d67086bb256be1981ccff05880a914bcfd272b1f2e"

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

  depends_on macos: :monterey

  app "wfview.app"

  zap trash: [
    "~/Library/Preferences/org.wfview.wfview.plist",
    "~/Library/Saved Application State/org.wfview.wfview.savedState",
  ]
end
