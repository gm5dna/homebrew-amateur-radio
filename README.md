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
- **qttinysa**: Software for controlling the TinySA spectrum analyzer.

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
