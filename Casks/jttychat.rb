cask "jttychat" do
  version "1.15"
  sha256 :no_check

  url "https://vk3tpm-150585202763-ap-southeast-2-an.s3-ap-southeast-2.amazonaws.com/JttyChat/JttyChat.zip"
  name "JTTY Chat"
  desc "Chat client for the JTTY keyboard-to-keyboard digital mode"
  homepage "https://blog.marxy.org/p/jttychat-for-macos.html"

  livecheck do
    url :homepage
    regex(/Latest\s+features:(?:\s*<[^>]+>)*\s*v(\d+(?:\.\d+)+)/i)
  end

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "JttyChat.app"

  zap trash: [
    "~/Library/Preferences/org.marxy.JttyChat.plist",
    "~/Library/Saved Application State/org.marxy.JttyChat.savedState",
  ]
end
