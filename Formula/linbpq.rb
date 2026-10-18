class Linbpq < Formula
  desc "G8BPQ AX.25 packet switch (Linux/macOS port of BPQ32)"
  homepage "https://github.com/g8bpq/linbpq"
  # Upstream has no tags or releases; pin to a specific commit. Bump the URL,
  # sha256 and version together when reviewing — the version is taken from
  # KVerstring in Versions.h.
  url "https://github.com/g8bpq/linbpq/archive/228047d76f410e13a564fb00787516f69b96ff44.tar.gz"
  version "6.0.26.1"
  sha256 "96f7eb084ffcdfd6df9df52fa29a1217c11bffe412925c2a5c4454888fb885f7"
  license :cannot_represent

  livecheck do
    url "https://raw.githubusercontent.com/g8bpq/linbpq/master/Versions.h"
    regex(/KVerstring\s+"v?(\d+(?:\.\d+)+)/i)
  end

  depends_on "libconfig"
  depends_on "miniupnpc"

  def install
    # winstdint.h is a bundled Windows <stdint.h> replacement guarded by
    # _STDINT_H, but Apple's stdint.h uses _STDINT_H_, so the guard never
    # fires and its 32-bit typedefs clash with the SDK's (intptr_t, uintptr_t,
    # intmax_t, uintmax_t). Defer to the real header instead.
    # The file has CRLF line endings, hence the \r? in the pattern.
    inreplace "winstdint.h",
              /#ifndef _STDINT_H\r?\n#define _STDINT_H\r?\n/,
              "#include <stdint.h>\n#define _STDINT_H\n#ifndef _STDINT_H\n"

    # Bundled libpng 1.2.x assumes Mac OS Classic when TARGET_OS_MAC is set,
    # pulling <fp.h> which doesn't exist on modern macOS. Force the standard
    # <math.h> path so the bundled png sources compile.
    inreplace "pngconf.h",
              /#  if defined\(MACOS\).*?#  endif/m,
              "#  include <math.h>"

    # 6.0.25.40 added GCC's libbacktrace to annotate crash dumps with source
    # file and line numbers. macOS has no libbacktrace and the makefile never
    # links it on any platform, so stub its three entry points. execinfo.h
    # still supplies backtrace() and backtrace_symbols_fd(), so the SIGSEGV
    # and SIGABRT handlers keep dumping stacks, just without source lines.
    inreplace "LinBPQ.c", "#include <backtrace.h>", <<~C.chomp
      struct backtrace_state;
      typedef void (*backtrace_error_callback)(void *data, const char *msg, int errnum);
      typedef int (*backtrace_full_callback)(void *data, uintptr_t pc, const char *filename, int lineno, const char *function);
      static inline struct backtrace_state *backtrace_create_state(const char *filename, int threaded, backtrace_error_callback errcb, void *data) { return NULL; }
      static inline int backtrace_pcinfo(struct backtrace_state *state, uintptr_t pc, backtrace_full_callback cb, backtrace_error_callback errcb, void *data) { return cb(data, pc, NULL, 0, NULL); }
      static inline void backtrace_print(struct backtrace_state *state, int skip, FILE *file) {}
    C

    # 6.0.26.1's PTTCATThread drives PTT from a serial port's CTS line by
    # blocking in ioctl(TIOCMIWAIT), which is Linux-only. Poll CTS with
    # TIOCMGET every 10 ms instead, comparing with the last state reported so
    # a change between polls is never lost. The first pass reports the
    # current state.
    inreplace "RigControl.c",
              /if \(ioctl\(fd, TIOCMIWAIT, TIOCM_CTS\) < 0\)\s*\{.*?return;\s*\}/m,
              <<~C.chomp
                {
                  static int last_cts = -1;
                  int now;
                  for (;;)
                  {
                    if (ioctl(fd, TIOCMGET, &now) < 0)
                    {
                      perror("ioctl TIOCMGET failed");
                      close(fd);
                      return;
                    }
                    if ((now & TIOCM_CTS) != last_cts)
                      break;
                    usleep(10000);
                  }
                  last_cts = now & TIOCM_CTS;
                }
              C

    # The Linux build rule appends `sudo setcap ...` after linking. setcap
    # doesn't exist on macOS and the capabilities aren't needed here.
    inreplace "makefile", /^\tsudo setcap.*$/, ""

    ENV.append "LIBRARY_PATH", HOMEBREW_PREFIX/"lib"
    system "make", "EXTRA_CFLAGS=-DMACBPQ -DNOMQTT -I#{HOMEBREW_PREFIX}/include"

    bin.install "linbpq"
  end

  def caveats
    <<~EOS
      linbpq is a packet-radio node and switch. It needs a bpq32.cfg
      configuration file plus runtime data directories before it will start.
      See https://www.cantab.net/users/john.wiseman/Documents/ for the
      installation guide and example configuration.
    EOS
  end

  test do
    # .scrub: the help text contains a Latin-1 copyright byte that is not
    # valid UTF-8 and would crash assert_match.
    assert_match "G8BPQ AX25 Packet Switch", shell_output("#{bin}/linbpq --help").scrub
  end
end
