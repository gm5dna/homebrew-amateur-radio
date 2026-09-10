class WsjtxImprovedAuto < Formula
  desc "WSJT-X Improved with optional Wait and Pounce re-arming"
  homepage "https://sourceforge.net/projects/wsjt-x-improved/"
  url "https://downloads.sourceforge.net/project/wsjt-x-improved/WSJT-X_v3.2.0/Source%20code/wsjtx-3.2.0_improved_PLUS_260908.tgz"
  version "3.2.0-260908"
  sha256 "97e47c656ff1c906f824107f430af646f4497d27f42d53398bbdd89bf84bbe29"
  license "GPL-3.0-or-later"

  livecheck do
    url "https://sourceforge.net/projects/wsjt-x-improved/rss?path=/"
    regex(%r{/wsjtx[._-]v?(\d+(?:\.\d+)+)[._-]improved[._-]PLUS[._-](\d+)\.t}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0]}-#{match[1]}" }
    end
  end

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "fftw"
  depends_on "gcc"
  depends_on "hamlib"
  depends_on "libusb"
  depends_on "portaudio"
  depends_on "qt@5"

  def install
    ENV["FC"] = formula_opt_bin("gcc")/"gfortran"

    # GCC's libgomp is needed for Fortran OpenMP code linked by clang++
    gomp_lib = formula_opt_lib("gcc")/"gcc/current/libgomp.dylib"

    # The tarball is a superbuild wrapper (bundled hamlib 4.7.2 plus
    # src/wsjtx.tgz) that no longer configures under CMake 4. Unpack the
    # inner tree and build it directly against brewed hamlib, which is the
    # same 4.7.2 release. Both wrapper patch files are empty.
    system "tar", "-xzf", "src/wsjtx.tgz", "-C", "src"

    # Skip bundle_fixup which fails resolving @rpath libs;
    # Homebrew manages shared library dependencies instead
    inreplace "src/wsjtx/CMakeLists.txt",
              "add_subdirectory (bundle_fixup)",
              "# add_subdirectory (bundle_fixup) # skipped for Homebrew"

    # iconutil cannot build the app icon inside Homebrew's build sandbox on
    # macOS 26 (it reports "Invalid Iconset" for an iconset that converts
    # cleanly outside the sandbox), so the icon is assembled from the same
    # PNGs below and the CMake rule is made a no-op.
    inreplace "src/wsjtx/CMakeLists.txt",
              "COMMAND iconutil -c icns --output \"${CMAKE_BINARY_DIR}/${WSJTX_ICON_FILE}\" " \
              "\"${CMAKE_SOURCE_DIR}/icons/Darwin/${CMAKE_PROJECT_NAME}.iconset\"",
              "COMMAND true"

    # Local change: re-arm Wait and Pounce after a QSO started while it was
    # armed is logged, so it need not be re-armed by hand. Upstream has no
    # code repository, so this cannot be sent as a pull request. The setting
    # is opt-in and defaults to off. All source files use CRLF line endings,
    # so every anchor below has to as well.
    inreplace "src/wsjtx/widgets/mainwindow.cpp" do |s|
      s.gsub! "\r\nbool pounce = false;\r\n",
              "\r\nbool pounce = false;\r\nbool pounce_qso = false;  // Tx enabled while Pounce armed\r\n"
      # Pounce disarms itself 3 s after enabling Tx, so remember it was armed
      s.gsub! "QTimer::singleShot (3000, [=] {pounce = false;});",
              "QTimer::singleShot (3000, [=] {pounce_qso = pounce; pounce = false;});"
      # 2 s after logging, and after read_txLog() refreshes the worked-before
      # guard. !m_auto keeps it disarmed while Tx is still enabled.
      s.gsub! "      pounce = false;\r\n      filtered = false;\r\n      read_txLog();",
              "      if (pounce_qso && !m_auto && m_config.pounce_rearm()) pounce = true;  " \
              "// re-arm Wait and Pounce\r\n      pounce_qso = false;\r\n      " \
              "filtered = false;\r\n      read_txLog();"
      # Stop and Stop Tx (two byte-identical sites) never re-arm from a stale flag
      s.gsub! "  pounce = false;\r\n  ui->autoButton->setChecked(false);",
              "  pounce = false;\r\n  pounce_qso = false;\r\n  ui->autoButton->setChecked(false);"
      # Right-click Enable Tx means "finish this one, stay disarmed"
      s.gsub! "      } else {\r\n        pounce = false;\r\n        check_button_color();",
              "      } else {\r\n        pounce = false;\r\n        " \
              "pounce_qso = false;\r\n        check_button_color();"
    end

    inreplace "src/wsjtx/Configuration.hpp",
              "  bool Wait_features_enabled () const;\r\n",
              "  bool Wait_features_enabled () const;\r\n  bool pounce_rearm () const;\r\n"

    # The setting itself, following the Wait_features_enabled template
    inreplace "src/wsjtx/Configuration.cpp" do |s|
      s.gsub! "  bool Wait_features_enabled_;\r\n",
              "  bool Wait_features_enabled_;\r\n  bool pounce_rearm_;\r\n"
      s.gsub! "bool Configuration::Wait_features_enabled () const {return m_->Wait_features_enabled_;}\r\n",
              "bool Configuration::Wait_features_enabled () const {return m_->Wait_features_enabled_;}\r\n" \
              "bool Configuration::pounce_rearm () const {return m_->pounce_rearm_;}\r\n"
      s.gsub! "  ui_->enable_Wait_features_check_box->setChecked(Wait_features_enabled_);\r\n",
              "  ui_->enable_Wait_features_check_box->setChecked(Wait_features_enabled_);\r\n  " \
              "ui_->cbPounceRearm->setChecked(pounce_rearm_);\r\n"
      s.gsub! "  Wait_features_enabled_ = settings_->value(\"WaitFeaturesEnabled\",true).toBool ();\r\n",
              "  Wait_features_enabled_ = settings_->value(\"WaitFeaturesEnabled\",true).toBool ();\r\n  " \
              "pounce_rearm_ = settings_->value (\"PounceRearm\", false).toBool ();\r\n"
      s.gsub! "  settings_->setValue (\"WaitFeaturesEnabled\", Wait_features_enabled_);\r\n",
              "  settings_->setValue (\"WaitFeaturesEnabled\", Wait_features_enabled_);\r\n  " \
              "settings_->setValue (\"PounceRearm\", pounce_rearm_);\r\n"
      s.gsub! "  Wait_features_enabled_ = ui_->enable_Wait_features_check_box->isChecked ();\r\n",
              "  Wait_features_enabled_ = ui_->enable_Wait_features_check_box->isChecked ();\r\n  " \
              "pounce_rearm_ = ui_->cbPounceRearm->isChecked ();\r\n"
    end

    # The checkbox, in Settings > General > Additional features. Row 2 is the
    # first free row of that group box's grid (1, 3, 4 and 5 are taken), so it
    # sits directly above "Enable Wait features". "and" not "&": a bare
    # ampersand in a QCheckBox label is a Qt mnemonic marker.
    tip = "After a QSO started while Wait and Pounce was armed is logged, " \
          "arm Wait and Pounce again instead of leaving it off."
    wait_item = <<~XML
      <item row="3" column="0">
       <widget class="QCheckBox" name="enable_Wait_features_check_box">
        <property name="text">
         <string>Enable Wait features</string>
        </property>
       </widget>
      </item>
    XML
    rearm_item = <<~XML
      <item row="2" column="0" colspan="4">
       <widget class="QCheckBox" name="cbPounceRearm">
        <property name="toolTip">
         <string>#{tip}</string>
        </property>
        <property name="text">
         <string>Keep Wait and Pounce armed after logging a QSO</string>
        </property>
       </widget>
      </item>
    XML
    ui_item = ->(xml) { xml.gsub(/^/, " " * 14).gsub("\n", "\r\n") }
    inreplace "src/wsjtx/Configuration.ui",
              ui_item[wait_item],
              ui_item[wait_item] + ui_item[rearm_item]

    prefix_path = %w[qt@5 hamlib fftw boost libusb portaudio].map do |dep|
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

    system "cmake", "-S", "src/wsjtx", "-B", "build", *args, *std_cmake_args

    # An .icns is a header plus typed PNG chunks; these are the type codes
    # iconutil emits for each iconset member.
    iconset = buildpath/"src/wsjtx/icons/Darwin/wsjtx.iconset"
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

    # Build produces wsjtx.app; rename it so it cannot be confused with the
    # wsjtx and wsjtx-improved casks
    mv prefix/"wsjtx.app", prefix/"wsjtx-improved-auto.app" if (prefix/"wsjtx.app").exist?

    # Drop upstream's sysctl tuning plist: it's intended for the
    # official .pkg installer to load into /Library/LaunchDaemons
    # and has no effect from a Cellar path. Its presence also makes
    # `brew install` print a misleading `brew services start` hint.
    # Its companion ReadMe.txt describes that installer. Both are
    # guarded so that upstream dropping either does not break the build.
    %w[com.wsjtx.sysctl.plist ReadMe.txt].each do |file|
      rm(prefix/file) if (prefix/file).exist?
    end
  end

  def caveats
    <<~EOS
      WSJT-X Improved with Wait and Pounce re-arming is installed at:
        #{opt_prefix}/wsjtx-improved-auto.app
      To show it in Finder and Launchpad, link it into /Applications:
        ln -s #{opt_prefix}/wsjtx-improved-auto.app /Applications/

      It shares its settings and log files with WSJT-X and WSJT-X Improved,
      so give it a configuration of its own:
        #{opt_prefix}/wsjtx-improved-auto.app/Contents/MacOS/wsjtx --rig-name improved

      The re-arm setting is off by default. Turn it on in Settings >
      General > Additional features, "Keep Wait and Pounce armed after
      logging a QSO". With it on:

        - Re-arming happens on the logging path only, so set "Prompt me to
          log QSO" or "Log automatically". With the prompt, click OK
          promptly: the worked-station guard re-reads wsjtx.log 2 s and 7 s
          after logging.
        - Keep the Tx watchdog enabled. It is the only backstop if Pounce
          calls a station that never replies.
        - "CQ: First" has no worked-before guard, so use CQ: Max Dist, Max
          dB or Min dB, or enable "Ignore stations worked today" or
          "Ignore B4".
        - To finish a Pounce QSO without re-arming, right-click Enable Tx.
          Stop and Stop Tx also cancel the re-arm.
    EOS
  end

  test do
    assert_predicate prefix/"wsjtx-improved-auto.app/Contents/MacOS/wsjtx", :executable?
  end
end
