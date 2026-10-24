cask "qk-lp100a" do
  version "0.1.0-alpha.5"
  sha256 "57412b651011bc83f0e8e51b00ab9b61ced0844723e751a4cf98e9a040939d1f"

  url "https://github.com/mikeg-dal/QK-LPA100A/releases/download/v#{version}/QK-LP100A-#{version}-macos.dmg"
  name "QK-LP100A"
  desc "Display and antenna sweeps for the TelePost LP-100A RF wattmeter"
  homepage "https://mikeg-dal.github.io/QK-LPA100A/"

  livecheck do
    url "https://mikeg-dal.github.io/QK-LPA100A/releases.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "QK-LP100A.app"

  zap trash: [
        "~/Library/Application Support/AI5QK/QK-LP100A",
        "~/Library/Preferences/com.ai5qk.QK-LP100A.plist",
        "~/Library/Saved Application State/com.ai5qk.qk-lp100a.savedState",
      ],
      rmdir: "~/Library/Application Support/AI5QK"
end
