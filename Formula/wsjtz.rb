class Wsjtz < Formula
  desc "Weak-signal digital communication software with automation features"
  homepage "https://wsjt-z.sourceforge.io/"
  url "https://downloads.sourceforge.net/project/wsjt-z/Source/wsjtz-3.0.0-2.0.7.zip"
  version "3.0.0-2.0.7"
  sha256 "0065c1c3dff793ca2e198c50dd3506ac9f7636d2b8d4d2650d707515d4427732"
  license "GPL-3.0-or-later"

  livecheck do
    url "https://sourceforge.net/projects/wsjt-z/files/Source/"
    regex(/wsjtz[._-]v?(\d+\.\d+\.\d+(?:[._-]rc\d+)?[._-]\d+(?:\.\d+)+)\.zip/i)
    strategy :page_match
  end

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "fftw"
  depends_on "gcc"
  depends_on "hamlib"
  depends_on "libusb"
  depends_on "qt@5"

  def install
    ENV["FC"] = Formula["gcc"].opt_bin/"gfortran"

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
