class Nanovnasaver < Formula
  desc "Tool for reading, displaying, and saving data from NanoVNA analyzers"
  homepage "https://github.com/NanoVNA-Saver/nanovna-saver"
  url "https://github.com/NanoVNA-Saver/nanovna-saver/archive/refs/tags/v0.7.3.tar.gz"
  sha256 "932a9d54e6cdf3a7ee4fd9e5c75f8721b5a249b1de320feefb013de293717cd1"
  license "GPL-3.0-or-later"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on "python@3.12"

  def install
    venv = libexec/"venv"
    python = Formula["python@3.12"].opt_bin/"python3.12"
    system python, "-m", "venv", venv

    requirements = buildpath/"homebrew-requirements.txt"
    requirements.write <<~EOS
      numpy==2.2.2 \\
          --hash=sha256:23ae9f0c2d889b7b2d88a3791f6c09e2ef827c2446f1c4a3e3e76328ee4afd9a \\
          --hash=sha256:ac9bea18d6d58a995fac1b2cb4488e17eceeac413af014b1dd26170b766d8467
      packaging==24.2 \\
          --hash=sha256:09abb1bccd265c01f4a3aa3f7a7db064b36514d2cba19a2f694fe6150451a759
      pyserial==3.5 \\
          --hash=sha256:c4451db6ba391ca6ca299fb3ec7bae67a5c55dde170964c7a14ceefec02f2cf0
      shiboken6==6.8.2.1 \\
          --hash=sha256:d3dedeb3732ecfc920c9f97da769c0022a1c3bda99346a9eba56fbf093deaa75
      PySide6-Essentials==6.8.2.1 \\
          --hash=sha256:ae5cc48f7e9a08e73e3ec2387ce245c8150e620b8d5a87548ebd4b8e3aeae49b
      scipy==1.15.1 \\
          --hash=sha256:0ac102ce99934b162914b1e4a6b94ca7da0f4058b6d6fd65b0cef330c0f3346f \\
          --hash=sha256:c09aa9d90f3500ea4c9b393ee96f96b0ccb27f2f350d09a47f533293c78ea776
      setuptools==75.8.0 \\
          --hash=sha256:e3982f444617239225d675215d51f6ba05f845d4eec313da4418fdbb56fb27e3
      setuptools-scm==8.1.0 \\
          --hash=sha256:897a3226a6fd4a6eb2f068745e49733261a21f70b1bb28fce0339feb978d9af3
    EOS

    venv_python = venv/"bin/python"
    system venv_python, "-m", "pip", "install",
           "--disable-pip-version-check", "--require-hashes", "--only-binary=:all:", "--no-deps", "-r", requirements

    ENV["SETUPTOOLS_SCM_PRETEND_VERSION"] = version.to_s
    ENV.prepend_path "PATH", venv/"bin"
    ENV.prepend_path "PYTHONPATH", buildpath/"src"
    system venv_python, "-m", "tools.ui_compile"
    system venv_python, "-m", "pip", "install",
           "--disable-pip-version-check", "--no-deps", "--no-build-isolation", "."
    rm Dir[venv/"lib/python3.12/site-packages/PySide6/Qt/plugins/sqldrivers/libqsql{mimer,odbc,psql}.dylib"]

    bin.install_symlink venv/"bin/NanoVNASaver" => "nanovnasaver"

    app = prefix/"NanoVNASaver.app"
    (app/"Contents/MacOS").mkpath
    (app/"Contents/Resources").mkpath
    cp "NanoVNASaver_48x48.icns", app/"Contents/Resources/NanoVNASaver.icns"
    (app/"Contents/Info.plist").write <<~XML
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>CFBundleExecutable</key>
        <string>NanoVNASaver</string>
        <key>CFBundleIconFile</key>
        <string>NanoVNASaver</string>
        <key>CFBundleIdentifier</key>
        <string>io.github.nanovna-saver.NanoVNASaver</string>
        <key>CFBundleName</key>
        <string>NanoVNASaver</string>
        <key>CFBundlePackageType</key>
        <string>APPL</string>
        <key>CFBundleShortVersionString</key>
        <string>#{version}</string>
      </dict>
      </plist>
    XML
    (app/"Contents/MacOS/NanoVNASaver").write <<~EOS
      #!/bin/bash
      exec "#{opt_libexec}/venv/bin/NanoVNASaver-gui" "$@"
    EOS
    chmod 0755, app/"Contents/MacOS/NanoVNASaver"

    # Try to install to /Applications as well
    begin
      applications_app = Pathname("/Applications/NanoVNASaver.app")
      if File.exist?("/Applications")
        # Remove old version if it exists
        rm_r(applications_app) if applications_app.exist?
        # Copy to /Applications
        cp_r(prefix/"NanoVNASaver.app", applications_app)
      end
    rescue Errno::EPERM
      # Silently ignore permission errors - user can manually copy if needed
    end
  end

  def caveats
    apps_installed = File.exist?("/Applications/NanoVNASaver.app")
    if apps_installed
      <<~EOS
        NanoVNA Saver has been installed to /Applications/NanoVNASaver.app
        and can be launched from Spotlight or the Applications folder.

        Ensure your NanoVNA device is connected via USB.
      EOS
    else
      <<~EOS
        NanoVNA Saver has been installed to:
          #{opt_prefix}/NanoVNASaver.app

        To install to /Applications, run:
          cp -r #{opt_prefix}/NanoVNASaver.app /Applications/

        Ensure your NanoVNA device is connected via USB.
      EOS
    end
  end

  test do
    assert_path_exists prefix/"NanoVNASaver.app"
    assert_match "NanoVNASaver", shell_output("#{bin}/nanovnasaver --help")
  end
end
