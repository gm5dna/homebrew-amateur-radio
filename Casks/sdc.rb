cask "sdc" do
  version "19.0706"

  on_arm do
    sha256 "7a3c2ac4505b7e28cadaa46dad4ffd464693c2461dbb0231a5190155351b9624"

    url "https://www.lw-sdc.com/wp-content/uploads/SDC_#{version.dots_to_underscores}_mac_M_setup.zip"
  end
  on_intel do
    sha256 "51d8ad9ba94ae631315f5bd8f6a836d6f3a2e71cb02655c6655fe02b9d3b3281"

    url "https://www.lw-sdc.com/wp-content/uploads/SDC_#{version.dots_to_underscores}_mac_I_setup.zip"
  end

  name "SDC"
  desc "Software Defined Connectors: skimmers, rig sync and audio tools for ham radio"
  homepage "https://www.lw-sdc.com/"

  livecheck do
    url "https://www.lw-sdc.com/?page_id=79"
    regex(/SDC\s+v?(\d+(?:\.\d+)+)/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map(&:first)
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
