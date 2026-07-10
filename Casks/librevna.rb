cask "librevna" do
  version "1.6.5"

  on_arm do
    sha256 "efdfcd8a5e94880d930d556b6e294178a4e1eb99d690a5f05f70f780fefaa99d"

    url "https://github.com/jankae/LibreVNA/releases/download/v#{version}/LibreVNA-GUI-OSX-latest-v#{version}.zip"
  end
  on_intel do
    sha256 "594198384f7e15628cd13b561cb658a75ef3402398f3a57df508ea4d256e6bc8"

    url "https://github.com/jankae/LibreVNA/releases/download/v#{version}/LibreVNA-GUI-OSX-15-v#{version}.zip"
  end

  name "LibreVNA"
  desc "GUI for the LibreVNA open-source USB vector network analyser"
  homepage "https://github.com/jankae/LibreVNA"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "LibreVNA-GUI.app"

  zap trash: [
    "~/Library/Preferences/com.yourcompany.LibreVNA-GUI.plist",
    "~/Library/Saved Application State/com.yourcompany.LibreVNA-GUI.savedState",
  ]

  caveats do
    <<~EOS
      The bundle is unsigned. On first launch, Gatekeeper will block it:
      right-click LibreVNA-GUI.app in Finder and choose "Open", then confirm
      in the dialog. Alternatively, run:

        xattr -d com.apple.quarantine /Applications/LibreVNA-GUI.app
    EOS
  end
end
