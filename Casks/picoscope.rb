cask "picoscope" do
  version "7.2.24.9658"
  sha256 "9707f12038eca1ece2e49601479bfa5937be4fb372bf112e10c964f08591a7c0"

  url "https://www.picotech.com/download/software/sr/PicoScope_7_TandM_#{version}.x64.pkg"
  name "PicoScope"
  desc "Oscilloscope software for PicoScope test-and-measurement hardware"
  homepage "https://www.picotech.com/products/oscilloscope"

  livecheck do
    url "https://www.picotech.com/downloads/_lightbox/picoscope-7-stable-for-macos"
    regex(/PicoScope_7_TandM[._-]v?(\d+(?:\.\d+)+)\.x64\.pkg/i)
  end

  depends_on macos: :monterey

  pkg "PicoScope_7_TandM_#{version}.x64.pkg"

  uninstall pkgutil: "com.picotech.picoscope7tnm"

  zap trash: [
    "~/Library/Application Support/PicoScope 7 T&M",
    "~/Library/Preferences/com.picotech.picoscope7tnm.plist",
    "~/Library/Saved Application State/com.picotech.picoscope7tnm.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
