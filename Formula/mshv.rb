class Mshv < Formula
  desc "Weak-signal and meteor-scatter digital modes (FT8, FT4, FT2, JT65, Q65)"
  homepage "https://github.com/vu2cpl/mshv-macos-port"
  url "https://github.com/vu2cpl/mshv-macos-port/archive/refs/tags/v2.76.6-mac9.tar.gz"
  version "2.76.6-mac9"
  sha256 "520a53880aef77210407942867bd21144820336d63cf9d2b91c6d7aa7334824a"
  license "GPL-3.0-or-later"
  head "https://github.com/vu2cpl/mshv-macos-port.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+-mac\d+)$/i)
    strategy :git
  end

  depends_on "fftw"
  depends_on "portaudio"
  depends_on "qt@5"

  def install
    # CONFIG+=sdk_no_version_check silences the SDK version warning.
    # The .pro hardcodes /opt/homebrew (or /usr/local on Intel) and links
    # against PortAudio and FFTW from the prefix; both are keg-linked deps.
    system formula_opt_bin("qt@5")/"qmake", "CONFIG+=sdk_no_version_check", "MSHV_macOS.pro"
    system "make"

    # The build creates bin/MSHV.app
    prefix.install "bin/MSHV.app"

    # The build creates these as empty, user-writable directories inside the
    # bundle and Homebrew's cleaner removes empty directories from the keg,
    # so leave a file in each to keep them.
    resources = prefix/"MSHV.app/Contents/Resources"
    %w[RxWavs log ExportLog AllTxtMonthly Screenshots].each do |dir|
      (resources/dir).mkpath
      touch resources/dir/".keep"
    end
  end

  def caveats
    <<~EOS
      MSHV is installed at:
        #{opt_prefix}/MSHV.app
      To show it in Finder and Launchpad, link it into /Applications:
        ln -s #{opt_prefix}/MSHV.app /Applications/MSHV.app

      This is a native Apple Silicon port of LZ2HV's MSHV using PortAudio
      over CoreAudio. The bundle is not notarised.

      This port keeps user state (settings, macros, logs, QSO history)
      inside the app bundle:
        #{opt_prefix}/MSHV.app/Contents/Resources/
      `brew upgrade` and `brew reinstall` replace the bundle, so copy the
      settings/ and log/ directories somewhere safe first and copy them
      back afterwards.

      On first launch, macOS will ask for microphone access for receive
      audio.
    EOS
  end

  test do
    assert_predicate prefix/"MSHV.app/Contents/MacOS/MSHV", :executable?
  end
end
