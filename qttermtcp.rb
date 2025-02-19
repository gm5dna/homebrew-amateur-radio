cask "qttermtcp" do
  version "0.0.0.79"
  sha256 "c01e5ea266833d47469c7aa0d9f7ac582767de771960aaed57d07fd915de6237"

  url "https://github.com/g8bpq/QtTermTCP/archive/refs/tags/0.79.zip"
  name "QtTermTCP"
  desc "QtTermTCP terminal application"
  homepage "https://github.com/g8bpq/QtTermTCP"

  depends_on formula: "qt5"

  app "QtTermTCP.app"

  zap trash: [
    "~/Library/Preferences/com.g8bpq.QtTermTCP.plist",
    "~/Library/Application Support/QtTermTCP",
    "~/Library/Saved Application State/com.g8bpq.QtTermTCP.savedState"
  ]
end

# class Qttermtcp < Formula
#   desc "QtTermTCP terminal application"
#   homepage "https://github.com/g8bpq/QtTermTCP"
#   url "https://github.com/g8bpq/QtTermTCP/archive/refs/tags/0.79.zip"
#   version "0.0.0.79"
#   sha256 "c01e5ea266833d47469c7aa0d9f7ac582767de771960aaed57d07fd915de6237"
#   license "GPL-3.0-or-later"

#   depends_on "qt5"

#   def install
#     system "qmake", "QtTermTCP.pro"
#     system "make"
#     prefix.install "QtTermTCP.app"
#   end

#   def caveats
#     <<~EOS
#       The application has been installed as a macOS app bundle in:
#         #{opt_prefix}/QtTermTCP.app
      
#       You can link it to /Applications with:
#         ln -s #{opt_prefix}/QtTermTCP.app /Applications/QtTermTCP.app
#     EOS
#   end

#   test do
#     assert_predicate prefix/"QtTermTCP.app", :exist?, "QtTermTCP.app bundle was not installed"
#   end
# end

#  ---

# class Qttermtcp < Formula
#   desc "QtTermTCP terminal application"
#   homepage "https://github.com/g8bpq/QtTermTCP"
#   url "https://github.com/g8bpq/QtTermTCP/archive/refs/tags/0.79.zip"
#   version "0.0.0.79"
#   sha256 "c01e5ea266833d47469c7aa0d9f7ac582767de771960aaed57d07fd915de6237"
#   license "GPL-3.0-or-later"

#   depends_on "qt5" => :build

#   def install
#     # Remove unrecognized options if they cause configure to fail
#     # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
#     # system "./configure", "--disable-silent-rules", *std_configure_args
#     # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
#     system "qmake", "QtTermTCP.pro"
#     system "make"
#     bin.install "QtTermTCP.app/Contents/MacOS/QtTermTCP"
#   end

#   test do
#     system "#{bin}/QtTermTCP", "--version"
#   end
# end