class Mshv < Formula
  desc "Weak-signal and meteor-scatter digital modes (FT8, FT4, FT2, JT65, Q65)"
  homepage "https://github.com/dl1bz/mshv-macos-port"
  url "https://github.com/dl1bz/mshv-macos-port/archive/refs/tags/v2.76.6-mac2.tar.gz"
  version "2.76.6-mac2"
  sha256 "336d5f982042438d46be0c2232aa44c153690662107e98097128390521f1db55"
  license "GPL-3.0-or-later"
  head "https://github.com/dl1bz/mshv-macos-port.git", branch: "latest"

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
  end

  def post_install
    # Symlink into /Applications so it appears in Finder/Launchpad.
    # Only ever manage a symlink we created (one pointing into the Homebrew
    # prefix); never remove a real app or a symlink the user made themselves.
    applications_app = Pathname("/Applications/MSHV.app")
    if applications_app.symlink? && applications_app.readlink.to_s.start_with?(HOMEBREW_PREFIX.to_s)
      applications_app.unlink
    end
    ln_s opt_prefix/"MSHV.app", applications_app unless applications_app.exist?
  rescue Errno::EPERM
    opoo "Could not symlink to /Applications (permission denied)."
    opoo "Run: sudo ln -s #{opt_prefix}/MSHV.app /Applications/MSHV.app"
  end

  def caveats
    <<~EOS
      MSHV is installed at:
        #{opt_prefix}/MSHV.app
      and symlinked to /Applications/MSHV.app when that location is
      writable and no app of that name already exists there.

      This is a native Apple Silicon port of LZ2HV's MSHV using PortAudio
      over CoreAudio. The bundle is not notarised.

      User state (settings, logs, QSO history) lives in:
        ~/Library/Application Support/MSHV/
      so replacing the app preserves it. On first launch, macOS will ask
      for microphone access for receive audio.
    EOS
  end

  test do
    assert_predicate prefix/"MSHV.app/Contents/MacOS/MSHV", :executable?
  end
end
