cask "sdrplusplus-brown" do
  version :latest
  sha256 :no_check

  on_arm do
    url "https://github.com/sannysanoff/SDRPlusPlusBrown/releases/download/rolling/sdrpp_macos_arm.zip"
  end
  on_intel do
    url "https://github.com/sannysanoff/SDRPlusPlusBrown/releases/download/rolling/sdrpp_macos_intel.zip"
  end

  name "SDR++ Brown"
  desc "SDR++ fork with FT8/FT4 decoders, noise reduction, and KiwiSDR support"
  homepage "https://github.com/sannysanoff/SDRPlusPlusBrown"

  livecheck do
    skip "Rolling release with no versioned tags"
  end

  depends_on macos: :big_sur

  app "SDR++Brown.app"

  # No zap stanza: SDR++ Brown uses the same configuration paths
  # (~/Library/Application Support/sdrpp) as the sdrplusplus cask, so zapping
  # this cask would destroy SDR++'s settings too.

  caveats <<~EOS
    SDR++ Brown shares its configuration directory
    (~/Library/Application Support/sdrpp) with SDR++, and it is left in
    place on uninstall; "brew uninstall --zap sdrplusplus" removes it.
  EOS
end
