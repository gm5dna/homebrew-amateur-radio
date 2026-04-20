class Voacapl < Formula
  desc "HF propagation prediction engine (port of VOACAP)"
  homepage "https://github.com/jawatson/voacapl"
  url "https://github.com/jawatson/voacapl.git", tag: "v0.7.7"
  license "LGPL-2.1-or-later"
  head "https://github.com/jawatson/voacapl.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "gcc" # for gfortran

  def install
    ENV.deparallelize
    system "autoreconf", "-fvi"
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    assert_path_exists bin/"voacapl"
  end
end
