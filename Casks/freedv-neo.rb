cask "freedv-neo" do
  version :latest
  sha256 :no_check

  url "https://vk3tpm-150585202763-ap-southeast-2-an.s3-ap-southeast-2.amazonaws.com/FreeDVNeo.zip",
      verified: "vk3tpm-150585202763-ap-southeast-2-an.s3-ap-southeast-2.amazonaws.com/"
  name "FreeDV Neo"
  desc "Client for the FreeDV RADE V1 digital voice mode"
  homepage "https://blog.marxy.org/p/freedv-neo.html"

  livecheck do
    skip "No version in the download URL or on the download page"
  end

  depends_on macos: :sonoma

  app "FreeDVNeo.app"

  zap trash: [
    "~/Library/Preferences/org.marxy.FreeDVNeo.plist",
    "~/Library/Saved Application State/org.marxy.FreeDVNeo.savedState",
  ]

  caveats <<~EOS
    FreeDV Neo is an independent client by Peter Marks (VK3TPM), not an
    official release of the FreeDV project; the separate "freedv" cask
    installs the official FreeDV GUI.

    Upstream serves every build from one unversioned URL, so Homebrew
    cannot detect new versions. To pick up the current build, run:
      brew reinstall --cask freedv-neo
  EOS
end
