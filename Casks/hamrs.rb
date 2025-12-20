cask "hamrs" do
  version "2.45"

  on_arm do
    sha256 :no_check

    url "https://hamrs-dist.s3.amazonaws.com/hamrs-pro-#{version}-mac-arm64.dmg",
        verified: "hamrs-dist.s3.amazonaws.com"
  end
  on_intel do
    sha256 :no_check

    url "https://hamrs-dist.s3.amazonaws.com/hamrs-pro-#{version}-mac-x64.dmg",
        verified: "hamrs-dist.s3.amazonaws.com"
  end

  name "HAMRS Pro"
  desc "Amateur radio logging software"
  homepage "https://www.hamrs.app/"

  app "HAMRS Pro.app"
end
