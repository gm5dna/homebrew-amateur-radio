cask "picoscope" do
  version "7.2.30.10460"
  sha256 "4d3fd9d0b70989df0aec4a95df4157a94407c51f4dd9ca6d54ab7b47431cb861"

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
