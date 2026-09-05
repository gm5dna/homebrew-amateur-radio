cask "sdrconnect" do
  version "1.0.10"

  # Downloads are now hosted on Google Drive; the file IDs change with each
  # release and must be updated manually. Refresh both URLs when bumping the
  # version. The URLs carry no version string, so `brew audit` requires
  # `sha256 :no_check`.

  on_arm do
    sha256 :no_check

    url "https://drive.usercontent.google.com/download?id=1FHXM3CQqQnaQofhWw0s_1WV7Jo3jJyTX&export=download&confirm=t"

    depends_on macos: :ventura
  end
  on_intel do
    sha256 :no_check

    url "https://drive.usercontent.google.com/download?id=1HU_kH2A5zhV2vgeimAUrbdJVm3qabvt_&export=download&confirm=t"

    depends_on macos: :big_sur
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
