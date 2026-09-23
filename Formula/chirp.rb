class Chirp < Formula
  desc "Programming tool for amateur radio handhelds and mobiles"
  homepage "https://chirpmyradio.com/"
  # Cloudflare blocks the upstream builds on archive.chirpmyradio.com and master
  # is untagged, so pin a master commit versioned by its UTC commit date.
  url "https://github.com/kk7ds/chirp/archive/b28df6b3a6b48cbce107f9b70c3cc7aa490dec5d.tar.gz"
  version "20260919"
  sha256 "47d1cf8ae71895c5373e24748d7023c71c09a2009e5703dd0d5e82b81b13af32"
  license "GPL-3.0-or-later"

  livecheck do
    url "https://github.com/kk7ds/chirp/commits/master.atom"
    regex(/<updated>(\d{4})-(\d{2})-(\d{2})T/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map(&:join)
    end
  end

  depends_on "python@3.14"
  depends_on "wxpython"

  def install
    venv = libexec/"venv"
    system formula_opt_bin("python@3.14")/"python3.14", "-m", "venv", "--system-site-packages", venv

    requirements = buildpath/"homebrew-requirements.txt"
    requirements.write <<~EOS
      certifi==2026.7.22 \\
          --hash=sha256:62f22742b58a1a33014a2b6b706588a8d7e2a88ae7bd1a6ebe8c992928483775
      charset-normalizer==3.5.1 \\
          --hash=sha256:6df0ec430f9a831772c23ca5a224cba36517a58a84bb32c32bb59a9fa67c47f6
      idna==3.20 \\
          --hash=sha256:ab7ae7122974553370f0bdb919e1a960b2cd1bc1ef0276416d896db81c14582c
      lark==1.3.1 \\
          --hash=sha256:c629b661023a014c37da873b4ff58a817398d12635d3bbb2c5a03be7fe5d1e12
      pyserial==3.5 \\
          --hash=sha256:c4451db6ba391ca6ca299fb3ec7bae67a5c55dde170964c7a14ceefec02f2cf0
      requests==2.34.2 \\
          --hash=sha256:2a0d60c172f83ac6ab31e4554906c0f3b3588d37b5cb939b1c061f4907e278e0
      suds==1.2.0 \\
          --hash=sha256:2cf8ed43ed8a0df350027c741f5295d6be8443d4e820cb36f2c17b033e331d5b
      urllib3==2.8.0 \\
          --hash=sha256:0cf3cae568d36aa9576b28dfb35f11328f1cb974ca7647d9475ebb86c75ac6e3
      yattag==1.16.1 \\
          --hash=sha256:baa8f254e7ea5d3e0618281ad2ff5610e0e5360b3608e695c29bfb3b29d051f4
    EOS

    venv_python = venv/"bin/python"
    pip_args = %w[install --disable-pip-version-check --no-deps --no-build-isolation]
    # setuptools must be in the venv before yattag's sdist can build without isolation
    build_requirements = buildpath/"homebrew-build-requirements.txt"
    build_requirements.write <<~EOS
      setuptools==84.0.0 \\
          --hash=sha256:51a52592b3b99e102b609654876bd65f19f999935166d1352678931132b0c670
    EOS
    system venv_python, "-m", "pip", *pip_args, "--require-hashes", "-r", build_requirements
    system venv_python, "-m", "pip", *pip_args, "--require-hashes", "-r", requirements

    inreplace "chirp/__init__.py", 'CHIRP_VERSION = "py3dev"', "CHIRP_VERSION = \"next-#{version}\""
    system venv_python, "-m", "pip", *pip_args, "."

    bin.install_symlink venv/"bin/chirp", venv/"bin/chirpc"

    app = prefix/"CHIRP.app"
    (app/"Contents/MacOS").mkpath
    (app/"Contents/Resources").install "chirp/share/chirp.icns"
    (app/"Contents/Info.plist").write <<~XML
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>CFBundleExecutable</key>
        <string>CHIRP</string>
        <key>CFBundleIconFile</key>
        <string>chirp</string>
        <key>CFBundleIdentifier</key>
        <string>com.danplanet.chirp</string>
        <key>CFBundleName</key>
        <string>CHIRP</string>
        <key>CFBundlePackageType</key>
        <string>APPL</string>
        <key>CFBundleShortVersionString</key>
        <string>#{version}</string>
      </dict>
      </plist>
    XML
    (app/"Contents/MacOS/CHIRP").write <<~EOS
      #!/bin/bash
      exec "#{opt_libexec}/venv/bin/chirp" "$@"
    EOS
    chmod 0755, app/"Contents/MacOS/CHIRP"
  end

  def caveats
    <<~EOS
      CHIRP is installed at:
        #{opt_prefix}/CHIRP.app
      To show it in Finder and Launchpad, link it into /Applications:
        ln -s #{opt_prefix}/CHIRP.app /Applications/CHIRP.app
    EOS
  end

  test do
    assert_path_exists prefix/"CHIRP.app"
    ENV["CHIRP_TESTENV"] = "1"
    assert_match "--list-mem", shell_output("#{bin}/chirpc --help")
  end
end
