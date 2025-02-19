# class Qttermtcp < Formula
#   desc "QtTermTCP - TCP KISS Terminal for Amateur Radio Packet"
#   homepage "https://github.com/g8bpq/QtTermTCP"
#   url "https://github.com/g8bpq/QtTermTCP/archive/refs/tags/0.79.zip"
#   version "0.0.0.79"
#   sha256 "c01e5ea266833d47469c7aa0d9f7ac582767de771960aaed57d07fd915de6237"
#   license "GPL-3.0-or-later"

#   head "https://github.com/g8bpq/QtTermTCP.git", branch: "master"

#   depends_on "qt@5"

#   def install
#     # Ensure the QtMultimedia library is properly linked
#     system "qmake", "QMAKE_CXXFLAGS+=-I#{Formula["qt@5"].opt_include}",
#                    "QMAKE_LFLAGS+=-F#{Formula["qt@5"].opt_lib}",
#                    "LIBS+=-F#{Formula["qt@5"].opt_lib} -framework QtMultimedia"
#     system "make"
  
#     # Create a macOS application bundle
#     app_path = "QtTermTCP.app"
#     system "macdeployqt", app_path, "-verbose=3" # Use verbose output for more details
  
#     # Move the .app to /Applications (system-wide directory)
#     apps_dir = "#{ENV["HOME"]}/Applications"
  
#     # Ensure the directory exists (this is generally handled by macOS, but it's safe to check)
#     mkdir_p apps_dir
#     mv app_path, apps_dir
#   end  

#   def caveats
#     <<~EOS
#       QtTermTCP has been installed as a macOS application.
#       You can find it in:
#         ~/Applications/QtTermTCP.app
#     EOS
#   end

#   test do
#     assert_predicate "/Applications/QtTermTCP.app", :exist?
#   end
# end

class Qttermtcp < Formula
  desc "QtTermTCP terminal application"
  homepage "https://github.com/g8bpq/QtTermTCP"
  url "https://github.com/g8bpq/QtTermTCP/archive/refs/tags/0.79.zip"
  version "0.0.0.79"
  sha256 "c01e5ea266833d47469c7aa0d9f7ac582767de771960aaed57d07fd915de6237"
  license "GPL-3.0-or-later"

  depends_on "qt5" => :build

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "qmake", "QtTermTCP.pro"
    system "make"
    bin.install "QtTermTCP.app/Contents/MacOS/QtTermTCP"
  end

  test do
    system "#{bin}/QtTermTCP", "--version"
  end
end