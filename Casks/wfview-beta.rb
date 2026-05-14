cask "wfview-beta" do
  version "117"
  sha256 "f3ff45578281c658524cdc22b493ad281fde5ca0bc282c16c8cdcc68b7e9508b"

  url "https://github.com/eliggett/wfview/releases/download/beta-qt6-mac-#{version}/wfview.dmg",
      verified: "github.com/eliggett/wfview/"
  name "wfview (beta)"
  desc "Open source interface for Icom and Kenwood transceivers (Qt6 universal beta)"
  homepage "https://wfview.org/"

  livecheck do
    url "https://api.github.com/repos/eliggett/wfview/releases?per_page=100"
    regex(/beta-qt6-mac[._-](\d+)/i)
    strategy :json do |json, regex|
      json.filter_map { |r| r["tag_name"]&.match(regex)&.[](1) }.max_by(&:to_i)
    end
  end

  conflicts_with cask: "gm5dna/amateur-radio/wfview"
  depends_on macos: :monterey

  app "wfview.app"

  zap trash: [
    "~/Library/Preferences/org.wfview.wfview.plist",
    "~/Library/Saved Application State/org.wfview.wfview.savedState",
  ]
end
