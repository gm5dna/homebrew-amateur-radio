# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Qttermtcp < Formula
  desc "QtTermTCP - TCP KISS Terminal for Amateur Radio Packet"
  homepage "https://github.com/g8bpq/QtTermTCP"
  url "https://github.com/g8bpq/QtTermTCP/archive/refs/heads/master.zip"
  version "2025.02.19" # Use a date-based version since there are no releases
  sha256 "21b39b32e44989579f5c07d8a1432adc57e751f03a916edf3747de9c58fdb346"

  head "https://github.com/g8bpq/QtTermTCP.git", branch: "master"

  depends_on "qt"

  def install
    system "qmake", "QMAKE_CXXFLAGS+=-I#{Formula[\"qt\"].opt_include}", "QMAKE_LFLAGS+=-F#{Formula[\"qt\"].opt_lib}"
    system "make", "LIBS+=-lQtMultimedia"
    system "make"

    # Create a macOS application bundle
    app_path = "QtTermTCP.app"
    system "macdeployqt", app_path

    # Move the .app to /Applications
    apps_dir = "/Applications"
    apps_dir = "#{HOMEBREW_PREFIX}/Applications" unless File.writable?("/Applications")

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



# class Qttermtcp < Formula
#   desc ""
#   homepage ""
#   license ""
#   head "https://github.com/g8bpq/QtTermTCP.git"

#   # depends_on "cmake" => :build

#   # Additional dependency
#   # resource "" do
#   #   url ""
#   #   sha256 ""
#   # end

#   def install
#     # Remove unrecognized options if they cause configure to fail
#     # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
#     system "./configure", "--disable-silent-rules", *std_configure_args
#     # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
#   end

#   test do
#     # `test do` will create, run in and delete a temporary directory.
#     #
#     # This test will fail and we won't accept that! For Homebrew/homebrew-core
#     # this will need to be a test that verifies the functionality of the
#     # software. Run the test with `brew test QtTermTCP`. Options passed
#     # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
#     #
#     # The installed folder is not in the path, so use the entire path to any
#     # executables being tested: `system bin/"program", "do", "something"`.
#     system "false"
#   end
# end
