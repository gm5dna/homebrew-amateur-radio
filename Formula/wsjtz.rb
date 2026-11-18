class Wsjtz < Formula
  desc "Weak-signal digital communication software with automation features"
  homepage "https://github.com/sq9fve/wsjt-z"
  url "https://github.com/sq9fve/wsjt-z.git",
      revision: "3d2c92e61bd2383fdbc939bd1392e6e11fc622ef"
  version "3.0.0-2.0.20"
  license "GPL-3.0-or-later"
  head "https://github.com/sq9fve/wsjt-z.git", branch: "master"

  livecheck do
    url "https://raw.githubusercontent.com/sq9fve/wsjt-z/master/CMakeLists.txt"
    regex(/VERSION_Z\s+"(\d+(?:\.\d+)+)"/i)
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

  def install
    ENV["FC"] = formula_opt_bin("gcc")/"gfortran"

    # GCC's libgomp is needed for Fortran OpenMP code linked by clang++
    gomp_lib = formula_opt_lib("gcc")/"gcc/current/libgomp.dylib"

    # Skip bundle_fixup which fails resolving @rpath libs;
    # Homebrew manages shared library dependencies instead
    inreplace "CMakeLists.txt",
              "add_subdirectory (bundle_fixup)",
              "# add_subdirectory (bundle_fixup) # skipped for Homebrew"

    # iconutil cannot build the app icon inside Homebrew's build sandbox on
    # macOS 26 (it reports "Invalid Iconset" for an iconset that converts
    # cleanly outside the sandbox), so the icon is assembled from the same
    # PNGs below and the CMake rule is made a no-op. Same workaround as
    # wsjtx-improved-auto.
    inreplace "CMakeLists.txt",
              "COMMAND iconutil -c icns --output \"${CMAKE_BINARY_DIR}/${WSJTX_ICON_FILE}\" " \
              "\"${CMAKE_SOURCE_DIR}/icons/Darwin/${CMAKE_PROJECT_NAME}.iconset\"",
              "COMMAND true"

    prefix_path = %w[qt@5 hamlib fftw boost libusb].map do |dep|
      formula_opt_prefix(dep)
    end.join(";")

    args = %W[
      -DCMAKE_PREFIX_PATH=#{prefix_path}
      -DCMAKE_Fortran_COMPILER=#{formula_opt_bin("gcc")/"gfortran"}
      -DCMAKE_OSX_DEPLOYMENT_TARGET=#{MacOS.version}
      -DOpenMP_Fortran_FLAGS=-fopenmp
      -DOpenMP_Fortran_LIB_NAMES=gomp
      -DOpenMP_gomp_LIBRARY=#{gomp_lib}
      -DCMAKE_EXE_LINKER_FLAGS=#{gomp_lib}
      -DWSJT_SKIP_MANPAGES=ON
      -DWSJT_GENERATE_DOCS=OFF
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args

    # An .icns is a header plus typed PNG chunks; these are the type codes
    # iconutil emits for each iconset member.
    iconset = buildpath/"icons/Darwin/wsjtx.iconset"
    chunks = {
      "icon_16x16.png"      => "icp4", "icon_16x16@2x.png"   => "ic11",
      "icon_32x32.png"      => "icp5", "icon_32x32@2x.png"   => "ic12",
      "icon_128x128.png"    => "ic07", "icon_128x128@2x.png" => "ic13",
      "icon_256x256.png"    => "ic08", "icon_256x256@2x.png" => "ic14",
      "icon_512x512.png"    => "ic09", "icon_512x512@2x.png" => "ic10"
    }.map do |png, type|
      data = (iconset/png).binread
      type + [data.bytesize + 8].pack("N") + data
    end.join
    (buildpath/"build/wsjtx.icns").binwrite("icns" + [chunks.bytesize + 8].pack("N") + chunks)

    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    # Build produces wsjtx.app; rename to wsjtz.app to avoid confusion with WSJT-X
    mv prefix/"wsjtx.app", prefix/"wsjtz.app"

    # Drop upstream's sysctl tuning plist — it's intended for the
    # official .pkg installer to load into /Library/LaunchDaemons
    # and has no effect from a Cellar path. Its presence also makes
    # `brew install` print a misleading `brew services start` hint.
    # Its companion ReadMe.txt describes that installer. Both are
    # guarded so that upstream dropping either does not break the build.
    rm [prefix/"com.wsjtx.sysctl.plist", prefix/"ReadMe.txt"].select(&:exist?)
  end

  def caveats
    <<~EOS
      WSJT-Z is installed at:
        #{opt_prefix}/wsjtz.app
      To show it in Finder and Launchpad, link it into /Applications:
        ln -s #{opt_prefix}/wsjtz.app /Applications/wsjtz.app

      Note: WSJT-Z shares some configuration paths with WSJT-X.
      If both are installed, they may share settings.
    EOS
  end

  test do
    assert_predicate prefix/"wsjtz.app/Contents/MacOS/wsjtx", :executable?
  end
end
