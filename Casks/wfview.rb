cask "wfview" do
  version "2.20,1675"
  sha256 "afa585ec30f0cf3a8f40b800b690ac7a83a6345c243a6fac5692a126df7f670d"

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

  depends_on macos: ">= :monterey"

  app "wfview.app"

  zap trash: [
    "~/Library/Preferences/org.wfview.wfview.plist",
    "~/Library/Saved Application State/org.wfview.wfview.savedState",
  ]
end
