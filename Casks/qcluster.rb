cask "qcluster" do
  version "1.0.7"
  sha256 :no_check

  url "https://qso365.co.uk/qcluster/qcluster.dmg"
  name "QCluster"
  desc "DX cluster client with spot filtering and alerts"
  homepage "https://qso365.co.uk/qcluster/"

  livecheck do
    url "https://qso365.co.uk/qcluster/version.txt"
    regex(/^version=(\d+(?:\.\d+)+)/i)
  end

  depends_on macos: :sonoma

  app "QCluster.app"

  zap trash: [
    "~/Library/Application Scripts/qso365.qcluster",
    "~/Library/Containers/qso365.qcluster",
  ]
end
