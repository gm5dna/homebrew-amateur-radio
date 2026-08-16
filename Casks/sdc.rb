cask "sdc" do
  version "19.0709"

  on_arm do
    sha256 "78c70685d73fa3f3a6fc6fc6bf9a617fe75bf99786ad637c7cf69e7d2a32dacf"

    url "https://www.lw-sdc.com/wp-content/uploads/SDC_#{version.dots_to_underscores}_mac_M_setup.zip"
  end
  on_intel do
    sha256 "20ad2ba3824ef38587e7de43038a3a8000da5fd7d4e4c827c152e09530597f81"

    url "https://www.lw-sdc.com/wp-content/uploads/SDC_#{version.dots_to_underscores}_mac_I_setup.zip"
  end

  name "SDC"
  desc "Software Defined Connectors: skimmers, rig sync and audio tools for ham radio"
  homepage "https://www.lw-sdc.com/"

  livecheck do
    url "https://www.lw-sdc.com/?page_id=79"
    # Match the macOS download link, not the page prose: lw-sdc.com announces
    # new versions in text before publishing the mac zips, which filed a false
    # update issue for 19.070801 (both mac URLs 404 at the time).
    regex(/SDC_(\d+(?:_\d+)+)_mac_M_setup\.zip/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| match.first.tr("_", ".") }
    end
  end

  depends_on macos: :monterey

  app "SDC.app"

  zap trash: [
    "~/Library/Application Support/SDC",
    "~/Library/Preferences/com.yourcompany.SDC.plist",
    "~/Library/Saved Application State/com.yourcompany.SDC.savedState",
  ]

  caveats <<~EOS
    The bundle is only ad-hoc signed and not notarised. On first launch,
    Gatekeeper will block it: right-click SDC.app in Finder and choose
    "Open", then confirm in the dialog. Alternatively, run:

      xattr -r -d com.apple.quarantine /Applications/SDC.app
  EOS
end
