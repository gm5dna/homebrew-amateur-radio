class Qttermtcp < Formula
  desc "QtTermTCP - TCP KISS Terminal for Amateur Radio Packet"
  homepage "https://github.com/g8bpq/QtTermTCP"
  url "https://github.com/g8bpq/QtTermTCP/archive/refs/tags/0.79.zip"
  version "0.0.0.79"
  sha256 "21b39b32e44989579f5c07d8a1432adc57e751f03a916edf3747de9c58fdb346"
  license "GPL-3.0-or-later"

  head "https://github.com/g8bpq/QtTermTCP.git", branch: "master"

  depends_on "qt@5"

  def install
    # Ensure the QtMultimedia library is properly linked
    system "qmake", "QMAKE_CXXFLAGS+=-I#{Formula["qt@5"].opt_include}",
                   "QMAKE_LFLAGS+=-F#{Formula["qt@5"].opt_lib}",
                   "LIBS+=-F#{Formula["qt@5"].opt_lib} -framework QtMultimedia"
    system "make"
  
    # Create a macOS application bundle
    app_path = "QtTermTCP.app"
    system "macdeployqt", app_path
  
    # Move the .app to /Applications (system-wide directory)
    apps_dir = "/Applications"
  
    # Ensure the directory exists (this is generally handled by macOS, but it's safe to check)
    mkdir_p apps_dir
    mv app_path, apps_dir
  end  

  def caveats
    <<~EOS
      QtTermTCP has been installed as a macOS application.
      You can find it in:
        /Applications/QtTermTCP.app
    EOS
  end

  test do
    assert_predicate "/Applications/QtTermTCP.app", :exist?
  end
end
