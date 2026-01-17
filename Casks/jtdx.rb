cask "jtdx" do
  version "2.2.159"

  on_arm do
    sha256 "6b96a6b91a06f9f2b0ec100f2b5c1c3e00b944f60be1a80dd11dfb823bd29ca7"

    url "https://downloads.sourceforge.net/jtdx/jtdx_#{version}/Apple%20Mac/16-bit_audio/jtdx-#{version}-Darwin-arm64.dmg",
        verified: "downloads.sourceforge.net/jtdx/"
  end
  on_intel do
    sha256 "5d05898a11488706c8336e0f0509781d0e70dd187ce30725df4b6a06ff1aaeb6"

    url "https://downloads.sourceforge.net/jtdx/jtdx_#{version}/Apple%20Mac/16-bit_audio/jtdx-#{version}-Darwin-x86_64.dmg",
        verified: "downloads.sourceforge.net/jtdx/"
  end

  name "JTDX"
  desc "Amateur radio digital modes software for FT8, JT65, JT9, and T10"
  homepage "https://www.jtdx.tech/"

  livecheck do
    url "https://sourceforge.net/projects/jtdx/files/"
    strategy :page_match
    regex(/jtdx[._-]v?(\d+(?:\.\d+)+)/i)
  end

  app "jtdx.app"

  zap trash: [
    "~/Library/Application Support/JTDX",
    "~/Library/Preferences/JTDX - by HF Community.plist",
    "~/Library/Saved Application State/JTDX - by HF Community.savedState",
  ]
end
