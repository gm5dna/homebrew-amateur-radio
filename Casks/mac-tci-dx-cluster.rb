cask "mac-tci-dx-cluster" do
  version "0.1.3"
  sha256 "48de2b161470e92d2077daaf8e6fc936cd797524b38aa28590d08566e27bf919"

  url "https://github.com/reflectingme/Mac-TCI-DX-Cluster/releases/download/v#{version}/Mac-TCI-DX-Cluster-#{version}-universal.dmg"
  name "Mac TCI DX Cluster"
  desc "Telnet DX cluster client that sends spots to TCI radio servers"
  homepage "https://gw3jvb.uk/software/mac-tci-dx-cluster/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Mac TCI DX Cluster.app"

  # Cluster passwords are kept in the Keychain, which zap cannot reach.
  zap trash: [
    "~/Library/Application Support/MacDX",
    "~/Library/Preferences/uk.gw3jvb.MacDX.plist",
    "~/Library/Saved Application State/uk.gw3jvb.MacDX.savedState",
  ]
end
