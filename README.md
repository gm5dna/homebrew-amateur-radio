# homebrew-amateur-radio

This is a custom Homebrew tap containing macOS software for amateur radio. It includes both formulae and casks for various tools and utilities for ham radio on macOS.

## Setting Up Homebrew

To get started with Homebrew, follow the official installation instructions here: [https://brew.sh](https://brew.sh)

Once Homebrew is installed, you can add this tap to your setup by running the following command:

```bash
brew tap gm5dna/amateur-radio
```

## Available Software

### Formulae
- **qttermtcp**: Terminal emulator for packet radio communication by John Wiseman G8BPQ.
- **nanovnasaver**: GUI application for measuring and analyzing NanoVNA devices (vector network analyzers).

### Casks

**Digital Modes & Weak Signal Communication**
- **freedv**: Open-source HF digital voice modem and GUI for amateur radio.
- **js8call**: Digital communication software for weak-signal operators using JS8 mode.
- **js8call-improved**: Improved version of JS8Call with bug fixes and enhanced features.
- **wsjtx**: Software for weak signal communication (FT8, JT65, JTDX, etc.).
- **wsjtx-improved**: Enhanced version of WSJT-X with additional features and improvements.
- **wsjtx-improved-alt**: WSJT-X Improved with alternative layout.
- **wsjtx-improved-ws**: WSJT-X Improved with widescreen layout.
- **wsjtz**: Software for weak signal communication with automation features.

**Logging & QSL Management**
- **hamrs**: Ham radio logging software for portable operations (POTA, Field Day, etc.).
- **rumlogng**: Comprehensive logging and QSL management software.
- **skookumlogger**: Advanced contest logging software by K1GQ.
- **waveloggate**: Gateway utility for WaveLog amateur radio logging software.

**SDR & Transceiver Control**
- **sdr-angel**: Software defined radio receiver/transmitter application with extensive device support.
- **sdrconnect**: Software for interfacing with SDRplay SDR devices.
- **ftdx10-cockpit**: Controller software for the Yaesu FTdx10 transceiver.

**Utilities**
- **pine64-updater**: Updater tool for Pine64 devices.

## Installing Software

### Installing a Cask
To install any cask from this tap, use:

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
To install a formula, use:

```bash
brew install <formula_name>
```

Examples:
```bash
brew install qttermtcp
brew install nanovnasaver
```

## Uninstalling Software

To remove any software installed from this tap:

```bash
# For casks
brew uninstall --cask <cask_name>

# For formulae
brew uninstall <formula_name>
```

## Updating Software

To update all software from this tap:

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

**"Command not found" after installation**
- Formulae are typically installed in `/opt/homebrew/bin/` on Apple Silicon Macs
- Make sure `/opt/homebrew/bin` is in your `$PATH`
- Add to your shell profile if needed: `export PATH="/opt/homebrew/bin:$PATH"`

**Qt-dependent software won't launch**
- Some formulae require Qt@5: `brew install qt@5`
- Casks may require additional dependencies; check the installation output for messages

**SHA256 checksum mismatch**
- This typically means the download URL is outdated
- Report an issue or create a pull request to update the formula/cask

## To Do
- Add [NanoVNA Saver](https://github.com/NanoVNA-Saver/nanovna-saver)
- Add [FT-710 Cockpit](https://w0xz.com/v/ft710/)

## Contributing

If you'd like to contribute or suggest new software for inclusion in this tap, feel free to open an issue or a pull request. When contributing:

1. Follow Homebrew's [Cask Cookbook](https://docs.brew.sh/Cask-Cookbook) for cask contributions
2. Follow Homebrew's [Formula Cookbook](https://docs.brew.sh/Formula-Cookbook) for formula contributions
3. Test installations locally before submitting a PR
4. Include a description of the software and why it's useful for amateur radio operators

## Resources

- [Homebrew Documentation](https://docs.brew.sh/)
- [Homebrew Cask Cookbook](https://docs.brew.sh/Cask-Cookbook)
- [Amateur Radio Online Resources](https://www.arrl.org/)
