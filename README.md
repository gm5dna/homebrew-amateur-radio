# homebrew-amateur-radio

A custom Homebrew tap with macOS software for amateur radio operators. This tap includes formulae and casks for ham radio tools and utilities.

## Getting Started

If you haven't installed Homebrew yet, follow the instructions at [https://brew.sh](https://brew.sh)

Once Homebrew is installed, add this tap:

```bash
brew tap gm5dna/amateur-radio
```

## Available Software

### Formulae
- **qttermtcp**: Terminal emulator for packet radio communication by John Wiseman G8BPQ
- **nanovnasaver**: GUI for measuring and analyzing NanoVNA vector network analyzers

### Casks

**Digital Modes & Weak Signal Communication**
- **cocoamodem**: Free digital modes app supporting RTTY, PSK31/63/125, MFSK16, Hellschreiber, CW, and more
- **freedv**: Open-source HF digital voice modem and GUI
- **js8call**: Digital communication software for weak-signal operators using JS8 mode
- **js8call-improved**: Enhanced version with bug fixes and additional features
- **wsjtx**: Popular weak signal software (FT8, JT65, JTDX, and more)
- **wsjtx-improved**: Enhanced WSJT-X with additional features
- **wsjtx-improved-alt**: WSJT-X Improved with alternative layout
- **wsjtx-improved-ws**: WSJT-X Improved with widescreen layout
- **wsjtz**: Weak signal communication with automation features

**Logging & QSL Management**
- **aether**: Native macOS logging app with rig control, LoTW/eQSL integration, and awards tracking
- **hamrs**: Logging software designed for portable operations (POTA, Field Day, etc.)
- **qlog**: Free/open-source cross-platform logger with no ads or tracking
- **rumlogng**: Comprehensive logging and QSL management
- **skookumlogger**: Advanced contest logging by K1GQ
- **waveloggate**: Gateway utility for WaveLog logging software

**Radio Programming**
- **chirp-next**: Program radios from multiple manufacturers and models

**SDR & Transceiver Control**
- **sdr-angel**: Software defined radio with extensive device support
- **sdrconnect**: Interface software for SDRplay devices
- **ftdx10-cockpit**: Controller for the Yaesu FTdx10 transceiver
- **qttinysa**: Control software for the TinySA spectrum analyzer

**Utilities**
- **hamclock-launcher**: Launcher for the HamClock application
- **pat**: Winlink client for emergency communications
- **pine64-updater**: Updater for Pine64 devices

## Installing Software

### Installing a Cask
To install any cask from this tap:

```bash
brew install --cask <cask_name>
```

Examples:
```bash
brew install --cask freedv
brew install --cask wsjtx
brew install --cask hamrs
```

### Installing a Formula
To install a formula:

```bash
brew install <formula_name>
```

Examples:
```bash
brew install qttermtcp
brew install nanovnasaver
```

## Uninstalling Software

To remove software from this tap:

```bash
# For casks
brew uninstall --cask <cask_name>

# For formulae
brew uninstall <formula_name>
```

## Updating Software

To update all software:

```bash
brew update
brew upgrade
```

To update a specific package:

```bash
brew upgrade <formula_or_cask_name>
```

## Troubleshooting

### Common Issues

**"App is damaged and can't be opened"**

Some applications may need to be allowed to run. Remove the quarantine attribute:
```bash
xattr -d com.apple.quarantine /Applications/AppName.app
```

**Permission errors during installation**

Ensure Homebrew has proper permissions:
```bash
sudo chown -R $(whoami) /opt/homebrew/Library/Taps/gm5dna
```

**Formula build failures**

Make sure you have the required build tools:
```bash
xcode-select --install
```

**Cask version appears outdated**

Update the tap and check for new versions:
```bash
brew update
brew upgrade --cask <cask_name>
```

### Getting Help

- Check the [Issues](https://github.com/gm5dna/homebrew-amateur-radio/issues) page for known problems
- Review Homebrew's troubleshooting guide: https://docs.brew.sh/Troubleshooting
- Open a new issue if you encounter a problem not covered here

## Contributing

Contributions are welcome! Whether you want to add new software, update existing packages, or improve documentation, please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Quick Contribution Guide

1. Fork this repository
2. Add or update the cask/formula
3. Test your changes: `brew install --cask your-package`
4. Run audit: `brew audit --strict --cask Casks/your-package.rb`
5. Submit a pull request

## License

This tap itself is open source. Individual software packages maintain their own licenses. Please check each package's homepage for license information.

## Maintainer

Maintained by GM5DNA. Questions or suggestions? Open an issue on GitHub.
