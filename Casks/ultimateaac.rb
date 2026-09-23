cask "ultimateaac" do
  arch_id = on_arch_conditional arm: "25", intel: "26"
  arch_cat = on_arch_conditional arm: "19:arm64bit", intel: "18:64bit"

  version "2.7.37"
  sha256 :no_check

  url "https://epc-mc.eu/index.php?option=com_phocadownload&view=category&download=#{arch_id}:setup-ultimateaac&id=#{arch_cat}&lang=en"
  name "UltimateAAC"
  desc "Award application centre for EPC, AGB, ERC and other digital-mode awards"
  homepage "https://epc-mc.eu/index.php?option=com_phocadownload&view=category&id=8:macos-x&lang=en"

  livecheck do
    url :homepage, compressed: false
    regex(%r{class="comment-title">v?(\d+(?:\.\d+)+)</span>}i)
  end

  depends_on :macos

  app "UltimateAAC.app"

  # Upstream edits Info.plist after signing, so the shipped signature is
  # invalid and macOS kills the app at launch; re-sign it ad hoc.
  preflight_steps do
    run "/usr/bin/codesign",
        args:           ["--force", "--deep", "--sign", "-", "UltimateAAC.app"],
        chdir:          ".",
        writable_paths: ["UltimateAAC.app"]
  end
end
