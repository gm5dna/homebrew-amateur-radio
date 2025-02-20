cask "hamrs" do
  version "2.31.1"

  on_arm do
    sha256 "9f3841f358e6549cbbe4a1388fa9955395e429118280821d2845bddad0b35236"

    url "https://hamrs-dist.s3.amazonaws.com/hamrs-pro-#{version}-mac-arm64.dmg",
        verified: "hamrs-dist.s3.amazonaws.com"
  end
  on_intel do
    sha256 "b72519418baa35c039d38546532a5d06a01bf9ffb963723dd2ff8dfde06bd6a2"

    url "https://hamrs-dist.s3.amazonaws.com/hamrs-pro-#{version}-mac-x64.dmg",
        verified: "hamrs-dist.s3.amazonaws.com"
  end

  name "HAMRS Pro"
  desc "Ham radio logging software"
  homepage "https://www.hamrs.app/"

  app "HAMRS Pro.app"
end
