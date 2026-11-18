cask "sdr-angel" do
  version "8.2.0"

  # The filenames embed the macOS version of the upstream build host
  # (e.g. mac-14.8.7), which changes between releases independently of the
  # SDRangel version — check the release assets when bumping. The separator
  # before it was `-mac-` in 8.1.0 only; it is `_mac-` again from 8.2.0.
  on_arm do
    sha256 "acb76d238f5b0d37c06a8f1c99b725144641965d8d206ba6de3cfedf4946c802"

    url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}_mac-15.8.2_arm64.dmg"

    depends_on macos: :sequoia
  end
  on_intel do
    sha256 "1bc3c50ed0929b9f97c9524e667a2f9b2adde9c0942759367c53de5138d87c82"

    url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}_mac-15.7.9_x86_64.dmg"

    depends_on macos: :sonoma
  end

  name "SDRangel"
  desc "Software defined radio receiver/transmitter application"
  homepage "https://github.com/f4exb/sdrangel"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  app "SDRangel.app"

  zap trash: [
    "~/Library/Application Support/f4exb/SDRangel",
    "~/Library/Preferences/com.f4exb.SDRangel.plist",
    "~/Library/Saved Application State/com.f4exb.SDRangel.savedState",
  ]
end
