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
    # Create virtual environment
    venv = buildpath/"venv"
    system "#{Formula["python@3.12"].bin}/python3.12", "-m", "venv", venv
    pip = venv/"bin/pip"
    python = venv/"bin/python3"

    # Upgrade pip and install build tools
    system pip, "install", "--upgrade", "pip", "setuptools", "setuptools-scm"

    # Install PySide6 first (needed for UI compilation)
    system pip, "install", "pyside6~=6.8"

    # Install project dependencies including dev dependencies (which contains pyinstaller)
    # Set version for setuptools-scm since we're using a tarball without git metadata
    ENV["SETUPTOOLS_SCM_PRETEND_VERSION"] = version.to_s
    system pip, "install", "-e", ".[dev]"

    # Compile UI files (required before building app)
    # Use the venv python to ensure tools are in PATH
    ENV["PATH"] = "#{venv}/bin:#{ENV["PATH"]}"
    system python, "-m", "tools.ui_compile"

    # Build the macOS app using PyInstaller
    system python, "-m", "pip", "install", "pyinstaller"
    system python, "-m", "PyInstaller", "--onedir", "-p", "src",
           "-n", "NanoVNASaver",
           "src/NanoVNASaver/__main__.py",
           "--recursive-copy-metadata", "NanoVNASaver",
           "--window", "--clean", "-y",
           "-i", "NanoVNASaver_48x48.icns"

    # Install the app bundle to prefix
    prefix.install "dist/NanoVNASaver.app"

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
          /opt/homebrew/opt/nanovnasaver/NanoVNASaver.app

        To install to /Applications, run:
          cp -r /opt/homebrew/opt/nanovnasaver/NanoVNASaver.app /Applications/

        Ensure your NanoVNA device is connected via USB.
      EOS
    end
  end

  test do
    assert_path_exists prefix/"NanoVNASaver.app"
  end
end
