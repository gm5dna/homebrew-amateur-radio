class Xastir < Formula
  desc "APRS client with mapping and weather alert support"
  homepage "https://github.com/Xastir/Xastir"
  url "https://github.com/Xastir/Xastir/archive/refs/tags/Release-2.2.4.tar.gz"
  sha256 "cc521b8590bacc8d1f1f99a6596660c46174f7c809d6ecbbbf4b8dfa57a68419"
  license "GPL-2.0-or-later"

  livecheck do
    url :homepage
    strategy :github_latest
    regex(/Release[._-]v?(\d+(?:\.\d+)+)/i)
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "berkeley-db"
  depends_on "graphicsmagick"
  depends_on "libgeotiff"
  depends_on "libx11"
  depends_on "libxpm"
  depends_on "libxt"
  depends_on "openmotif"
  depends_on "pcre2"
  depends_on "proj"
  depends_on "shapelib"

  uses_from_macos "curl"

  def install
    system "./bootstrap.sh"

    deps = %w[openmotif libgeotiff libx11 libxpm libxt pcre2 shapelib graphicsmagick proj berkeley-db]
    inc_dirs = deps.map { |dep| "-I#{Formula[dep].opt_include}" }.join(" ")
    lib_dirs = deps.map { |dep| "-L#{Formula[dep].opt_lib}" }.join(" ")

    mkdir "build" do
      system "../configure",
             "--prefix=#{prefix}",
             "--with-bdb-incdir=#{Formula["berkeley-db"].opt_include}",
             "--with-bdb-libdir=#{Formula["berkeley-db"].opt_lib}",
             "CPPFLAGS=#{inc_dirs}",
             "LDFLAGS=#{lib_dirs}"
      system "make", "-j#{ENV.make_jobs}"
      system "make", "install"
    end
  end

  def caveats
    <<~EOS
      Xastir requires an X11 server to run. Install XQuartz if you haven't already:
        brew install --cask xquartz

      Launch Xastir from a terminal after starting XQuartz:
        xastir &

      Per-user configuration is stored in ~/.xastir/
    EOS
  end

  test do
    assert_predicate bin/"xastir", :executable?
    assert_match version.to_s, shell_output("#{bin}/xastir -V 2>&1")
  end
end
