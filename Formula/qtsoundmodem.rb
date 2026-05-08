class Qtsoundmodem < Formula
  desc "AX.25 packet-radio soundmodem (UZ7HO QtSoundModem, macOS Apple Silicon port)"
  homepage "https://github.com/gm5dna/qtsoundmodem-macos-port"
  license "GPL-3.0-or-later"
  head "https://github.com/gm5dna/qtsoundmodem-macos-port.git", branch: "macos-port"

  depends_on "cmake" => :build
  depends_on arch: :arm64
  depends_on "fftw"
  depends_on "hidapi"
  depends_on :macos
  depends_on "qt"

  def install
    system "cmake", "-S", ".", "-B", "build",
           "-DCMAKE_PREFIX_PATH=#{Formula["qt"].opt_prefix}",
           *std_cmake_args
    system "cmake", "--build", "build"
    prefix.install "build/QtSoundModem.app"
    bin.write_exec_script prefix/"QtSoundModem.app/Contents/MacOS/QtSoundModem"
  end

  def caveats
    <<~EOS
      QtSoundModem is a GUI app. Launch it with:
        open #{opt_prefix}/QtSoundModem.app

      The bundle is ad-hoc signed only. On first launch, Gatekeeper will
      block it: right-click the app in Finder and choose "Open", then
      confirm in the dialog.

      Microphone permission is requested on first audio open. If denied,
      the modem reads zero samples. Re-enable in:
        System Settings → Privacy & Security → Microphone

      Config and logs:
        ~/Library/Application Support/gm5dna/QtSoundModem/
    EOS
  end

  test do
    assert_predicate prefix/"QtSoundModem.app/Contents/MacOS/QtSoundModem", :executable?
  end
end
