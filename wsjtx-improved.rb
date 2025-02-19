cask "wsjtx-improved" do
    version "2.7.1,250106-RC8"
    sha256 :no_check # SourceForge links are often dynamically generated
  
    url "https://sourceforge.net/projects/wsjt-x-improved/files/WSJT-X_v#{version.csv.first}/macOS/wsjtx-#{version.csv.first}-devel_improved_PLUS_#{version.csv.second}_M1.zip/download",
        verified: "sourceforge.net/projects/wsjt-x-improved/files/"
  
    name "WSJT-X Improved"
    desc "Improved version of WSJT-X"
    homepage "https://sourceforge.net/projects/wsjt-x-improved/"
  
    depends_on macos: ">= :monterey"
  
    app "wsjtx-#{version.csv.first}-devel_improved_PLUS_#{version.csv.second}_M1.app"
  
    zap trash: [
      "~/Library/Application Support/WSJT-X",
      "~/Library/Preferences/wsjtx.plist",
      "~/Library/Saved Application State/wsjtx.savedState"
    ]
  end
  