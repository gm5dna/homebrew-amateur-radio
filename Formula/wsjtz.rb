class Wsjtz < Formula
  desc "Weak-signal digital communication software with automation features"
  homepage "https://github.com/sq9fve/wsjt-z"
  url "https://github.com/sq9fve/wsjt-z.git",
      revision: "7cbff9e555b1f6a1d50c3adcbfeee14ed78b1a30"
  version "3.0.0-2.0.8"
  license "GPL-3.0-or-later"
  head "https://github.com/sq9fve/wsjt-z.git", branch: "master"

  livecheck do
    url "https://raw.githubusercontent.com/sq9fve/wsjt-z/master/CMakeLists.txt"
    regex(/CPACK_PACKAGE_VERSION_Z\s+"(\d+(?:\.\d+)+)"/i)
    strategy :page_match do |page, regex|
      z = page[regex, 1]
      z ? "3.0.0-#{z}" : nil
    end
  end

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "fftw"
  depends_on "gcc"
  depends_on "hamlib"
  depends_on "libusb"
  depends_on "qt@5"

  # Workaround for upstream gitignore excluding lib/ftrsd/ — see
  # https://github.com/sq9fve/wsjt-z/issues/3. Files are pinned to a
  # commit on a third-party WSJT-X mirror; remove this block once
  # upstream commits the missing sources.
  resource "ftrsd-decode_rs" do
    url "https://raw.githubusercontent.com/paulh002/wsjtx_lib/8f182a126620459314eb26a3647cb7e542cd7d62/lib/ftrsd/decode_rs.c"
    sha256 "3bda365b9ad91ebf9928a21cdf5f3d4b9459701cf43b07e7dbb014d3092aa2cc"
  end

  resource "ftrsd-encode_rs" do
    url "https://raw.githubusercontent.com/paulh002/wsjtx_lib/8f182a126620459314eb26a3647cb7e542cd7d62/lib/ftrsd/encode_rs.c"
    sha256 "edc93c435f047f991f98cf9aae4c761c7daf427d9e7b879c99ad3fd0eee504ce"
  end

  resource "ftrsd-init_rs" do
    url "https://raw.githubusercontent.com/paulh002/wsjtx_lib/8f182a126620459314eb26a3647cb7e542cd7d62/lib/ftrsd/init_rs.c"
    sha256 "cf9746721096bfa10d72c16a79e437375b5939e4f5c22194024505e5d0358b06"
  end

  resource "ftrsd-ftrsdap" do
    url "https://raw.githubusercontent.com/paulh002/wsjtx_lib/8f182a126620459314eb26a3647cb7e542cd7d62/lib/ftrsd/ftrsdap.c"
    sha256 "0043c3f30fd2b2ae6bcfbb74844892ca07dcddf6de68f317ee0982f82c24bc79"
  end

  resource "ftrsd-rs2" do
    url "https://raw.githubusercontent.com/paulh002/wsjtx_lib/8f182a126620459314eb26a3647cb7e542cd7d62/lib/ftrsd/rs2.h"
    sha256 "120f62a91265a5a8b66eb97d0f2b33ad55f571a9e275c4c7d664881b7e9bb24c"
  end

  resource "ftrsd-int" do
    url "https://raw.githubusercontent.com/paulh002/wsjtx_lib/8f182a126620459314eb26a3647cb7e542cd7d62/lib/ftrsd/int.h"
    sha256 "f558d05de20dd802b5045fa50af92c7746c382f416f866642c5eb901c25d0579"
  end

  def install
    ENV["FC"] = Formula["gcc"].opt_bin/"gfortran"

    # Drop the ftrsd Reed-Solomon sources into place (see resource block above).
    (buildpath/"lib/ftrsd").mkpath
    {
      "ftrsd-decode_rs" => "decode_rs.c",
      "ftrsd-encode_rs" => "encode_rs.c",
      "ftrsd-init_rs"   => "init_rs.c",
      "ftrsd-ftrsdap"   => "ftrsdap.c",
      "ftrsd-rs2"       => "rs2.h",
      "ftrsd-int"       => "int.h",
    }.each do |res, dest|
      resource(res).stage { cp Dir["*"].first, buildpath/"lib/ftrsd"/dest }
    end

    # GCC's libgomp is needed for Fortran OpenMP code linked by clang++
    gomp_lib = Formula["gcc"].opt_lib/"gcc/current/libgomp.dylib"

    # Skip bundle_fixup which fails resolving @rpath libs;
    # Homebrew manages shared library dependencies instead
    inreplace "CMakeLists.txt",
              "add_subdirectory (bundle_fixup)",
              "# add_subdirectory (bundle_fixup) # skipped for Homebrew"

    mkdir "build" do
      prefix_path = %w[qt@5 hamlib fftw boost libusb].map do |dep|
        Formula[dep].opt_prefix
      end.join(";")

      args = %W[
        -DCMAKE_PREFIX_PATH=#{prefix_path}
        -DCMAKE_C_COMPILER=#{ENV.cc}
        -DCMAKE_CXX_COMPILER=#{ENV.cxx}
        -DCMAKE_Fortran_COMPILER=#{Formula["gcc"].opt_bin/"gfortran"}
        -DCMAKE_OSX_DEPLOYMENT_TARGET=#{MacOS.version}
        -DOpenMP_Fortran_FLAGS=-fopenmp
        -DOpenMP_Fortran_LIB_NAMES=gomp
        -DOpenMP_gomp_LIBRARY=#{gomp_lib}
        -DCMAKE_EXE_LINKER_FLAGS=#{gomp_lib}
        -DWSJT_SKIP_MANPAGES=ON
        -DWSJT_GENERATE_DOCS=OFF
      ]

      system "cmake", "..", *args, *std_cmake_args
      system "make", "-j#{ENV.make_jobs}"
      system "make", "install"
    end

    # Build produces wsjtx.app; rename to wsjtz.app to avoid confusion with WSJT-X
    mv prefix/"wsjtx.app", prefix/"wsjtz.app" if (prefix/"wsjtx.app").exist?

    # Drop upstream's sysctl tuning plist — it's intended for the
    # official .pkg installer to load into /Library/LaunchDaemons
    # and has no effect from a Cellar path. Its presence also makes
    # `brew install` print a misleading `brew services start` hint.
    rm(prefix/"com.wsjtx.sysctl.plist")
  end

  def post_install
    # Symlink to /Applications so it appears in Finder/Launchpad
    applications_app = Pathname("/Applications/wsjtz.app")
    applications_app.unlink if applications_app.symlink?
    rm_r(applications_app) if applications_app.exist?
    ln_s opt_prefix/"wsjtz.app", applications_app
  rescue Errno::EPERM
    opoo "Could not symlink to /Applications (permission denied)."
    opoo "Run: sudo ln -s #{opt_prefix}/wsjtz.app /Applications/wsjtz.app"
  end

  def caveats
    <<~EOS
      WSJT-Z has been symlinked to /Applications/wsjtz.app.

      Note: WSJT-Z shares some configuration paths with WSJT-X.
      If both are installed, they may share settings.
    EOS
  end

  test do
    assert_predicate prefix/"wsjtz.app/Contents/MacOS/wsjtx", :executable?
  end
end
