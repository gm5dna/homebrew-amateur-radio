class Voacapl < Formula
  desc "HF propagation prediction engine (port of VOACAP)"
  homepage "https://github.com/jawatson/voacapl"
  url "https://github.com/jawatson/voacapl.git",
      tag:      "v0.7.7",
      revision: "c12a98b348c39f36f2659b8b3aa97b86284c8a1d"
  # Upstream LICENSE: two Fortran utilities (dst2csv/dst2ascii) are GPL-3.0;
  # the rest is an ITS/VOACAP US-government "not subject to copyright" notice
  # with conditions, which has no SPDX identifier.
  license :cannot_represent
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
