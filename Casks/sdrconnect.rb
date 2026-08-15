cask "sdrconnect" do
  version "1.0.10"

  # Downloads are now hosted on Google Drive; the file IDs change with each
  # release and must be updated manually. Refresh both URLs and sha256 hashes
  # together when bumping the version.

  on_arm do
    sha256 "9f88705cf2167c1879fa9dc9e635deab51ead8a11842152956c1c0f223f971b5"

    url "https://drive.usercontent.google.com/download?id=1FHXM3CQqQnaQofhWw0s_1WV7Jo3jJyTX&export=download&confirm=t"

    depends_on macos: :ventura
  end
  on_intel do
    sha256 "50c247e4bb93f0392d2628ca75eaded9ab576fdc25283c3aefe45659d9606877"

    url "https://drive.usercontent.google.com/download?id=1HU_kH2A5zhV2vgeimAUrbdJVm3qabvt_&export=download&confirm=t"

    depends_on macos: :catalina
  end

  name "SDRconnect"
  desc "SDR application for SDRplay receivers with spectrum analysis"
  homepage "https://www.sdrplay.com/"

  livecheck do
    url "https://www.sdrplay.com/sdrconnect/"
    regex(/current\s+version\s+is\s*v?(\d+(?:\.\d+)+)/i)
  end

  app "SDRconnect.app"

  zap trash: [
    "~/Library/Application Support/SDRconnect",
    "~/Library/Preferences/com.sdrplay.SDRconnect.plist",
    "~/Library/Saved Application State/com.sdrplay.SDRconnect.savedState",
  ]
end
