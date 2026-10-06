cask "freedv-neo" do
  version "1.2.21"
  sha256 :no_check

  url "https://vk3tpm-150585202763-ap-southeast-2-an.s3-ap-southeast-2.amazonaws.com/FreeDVNeo/FreeDVNeo.zip"
  name "FreeDV Neo"
  desc "Client for the FreeDV RADE V1 digital voice mode"
  homepage "https://blog.marxy.org/p/freedv-neo.html"

  livecheck do
    url :homepage
    regex(/\(Version\s+v?(\d+(?:\.\d+)+)\)/i)
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
  EOS
end
