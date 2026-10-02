cask "sdc" do
  on_arm do
    version "19.08"
    sha256 "aee64e11ef06b9e5fad1627cd6fcaa2dcf5bba8debb048682c8c39318c556297"

    url "https://www.lw-sdc.com/wp-content/uploads/SDC_#{version.dots_to_underscores}_mac_M_setup.zip"
  end
  # Upstream stopped publishing Intel builds after 19.06 (19.0714 and 19.08
  # are macOS_M only), so Intel stays on the last release that has one.
  on_intel do
    version "19.06"
    sha256 "acf7e00015e74f985bf026752bf3e0d313c3e368023f0dd140d1d2ea3f51b5fa"

    url "https://www.lw-sdc.com/wp-content/uploads/SDC_#{version.dots_to_underscores}_mac_I_setup.zip"
  end

  name "SDC"
  desc "Software Defined Connectors: skimmers, rig sync and audio tools for ham radio"
  homepage "https://www.lw-sdc.com/"

  livecheck do
    url "https://www.lw-sdc.com/?page_id=79"
    # Match the download link, not the page prose: lw-sdc.com announces new
    # versions in text before publishing the mac zips. Versions mix 19.MMDD
    # and 19.MM (19.0518, 19.06, 19.0714, 19.08), which do not sort, so take
    # the first Apple Silicon link: the current release heads the page,
    # above the chronological archive.
    regex(/SDC[._-](\d+(?:[._]\d+)+)[._-]mac[._-]M[._-]setup\.zip/i)
    strategy :page_match do |page, regex|
      page[regex, 1]&.tr("_", ".")
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
