# homebrew-amateur-radio

[![CI](https://github.com/gm5dna/homebrew-amateur-radio/actions/workflows/ci.yml/badge.svg)](https://github.com/gm5dna/homebrew-amateur-radio/actions/workflows/ci.yml)

A Homebrew tap providing macOS software for amateur radio operators.

## What is Homebrew?

[Homebrew](https://brew.sh) is a free, open-source package manager for macOS that makes it easy to install, update, and manage software from the command line. Think of it as an "app store" for command-line tools and applications that aren't available in the Mac App Store.

### Why use Homebrew for amateur radio software?

- **Easy updates**: Update all your ham radio software with a single command
- **No hunting for downloads**: Homebrew knows where to find the latest versions
- **Clean uninstalls**: Homebrew tracks what it installs, making removal simple
- **Consistency**: Install and manage software the same way across all your Macs

### Installing Homebrew

If you don't have Homebrew installed, open **Terminal** (found in Applications → Utilities) and paste this command:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the on-screen instructions. The installer will explain what it's doing and ask for your password (this is your Mac login password—you won't see characters as you type, which is normal).

After installation completes, you may need to run additional commands shown in the Terminal to add Homebrew to your PATH. The installer will tell you exactly what to do.

To verify Homebrew is working:

```bash
brew --version
```

You should see a version number like `Homebrew 4.x.x`.

## Installation

### Add the tap

A "tap" is a collection of software packages. Adding this tap tells Homebrew where to find amateur radio software:

```bash
brew tap gm5dna/amateur-radio
```

### Install software

Once the tap is added, install any package:

```bash
# Install a cask (pre-built application)
brew install --cask gm5dna/amateur-radio/<name>

# Install a formula (built from source)
brew install gm5dna/amateur-radio/<name>
```

For example:

```bash
brew install --cask gm5dna/amateur-radio/wsjtx
brew install gm5dna/amateur-radio/nanovnasaver
```

## Available Software

### Formulae

| Name | Description |
|------|-------------|
| **nanovnasaver** | GUI for measuring and analyzing NanoVNA vector network analyzers |
| **qttermtcp** | Terminal emulator for packet radio communication by John Wiseman G8BPQ |

### Casks

#### Digital Modes & Weak Signal

| Name | Description |
|------|-------------|
| **cocoamodem** | Digital modes app supporting RTTY, PSK31/63/125, MFSK16, Hellschreiber, CW |
| **freedv** | Open-source HF digital voice modem and GUI |
| **js8call** | Digital communication using JS8 mode for weak-signal operators |
| **js8call-improved** | Enhanced JS8Call with bug fixes and additional features |
| **wsjtx** | Weak signal software (FT8, JT65, JTDX, and more) |
| **wsjtx-improved** | Enhanced WSJT-X with additional features |
| **wsjtx-improved-alt** | WSJT-X Improved with alternative layout |
| **wsjtx-improved-ws** | WSJT-X Improved with widescreen layout |
| **wsjtz** | Weak signal communication with automation features |

#### Logging & QSL Management

| Name | Description |
|------|-------------|
| **aether** | Native macOS logger with rig control, LoTW/eQSL integration, awards tracking |
| **hamrs** | Logging for portable operations (POTA, Field Day, etc.) |
| **qlog** | Cross-platform open-source logger with no ads or tracking |
| **rumlogng** | Comprehensive logging and QSL management |
| **skookumlogger** | Advanced contest logging by K1GQ |
| **waveloggate** | Gateway utility for WaveLog logging software |

#### Radio Programming

| Name | Description |
|------|-------------|
| **chirp-next** | Program radios from multiple manufacturers and models |

#### SDR & Transceiver Control

| Name | Description |
|------|-------------|
| **ftdx10-cockpit** | Controller for the Yaesu FTdx10 transceiver |
| **qttinysa** | Control software for the TinySA spectrum analyzer |
| **sdr-angel** | Software defined radio with extensive device support |
| **sdrconnect** | Interface software for SDRplay devices |
| **sdrplusplus** | Cross-platform SDR software (nightly build) |
| **sdrplusplus-brown** | SDR++ fork with FT8/FT4 decoders, noise reduction, SSB TX, remote monitoring |
| **sparksdr** | Software defined radio application |

#### Utilities

| Name | Description |
|------|-------------|
| **hamclock-launcher** | Launcher for the HamClock application |
| **pat** | Winlink client for emergency communications |
| **pine64-updater** | Updater for Pine64 devices (Pinecil, etc.) |

## Updating

To update all software from this tap:

```bash
brew update
brew upgrade --greedy
```

## Uninstalling Software

To remove an application:

```bash
brew uninstall --cask <name>

# Example
brew uninstall --cask wsjtx
```

To completely remove an application including its preferences and support files:

```bash
brew uninstall --cask --zap <name>
```

## Common Commands Reference

| Command | What it does |
|---------|--------------|
| `brew tap gm5dna/amateur-radio` | Add this tap to Homebrew |
| `brew install --cask <name>` | Install an application |
| `brew uninstall --cask <name>` | Remove an application |
| `brew update` | Refresh the list of available software |
| `brew upgrade` | Update all installed software |
| `brew upgrade --greedy` | Update all software, including apps that auto-update |
| `brew list --cask` | Show all installed applications |
| `brew info --cask <name>` | Show details about a package |

## Troubleshooting

### "command not found: brew"

Homebrew isn't in your PATH. On Apple Silicon Macs (M1/M2/M3/M4), run:

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Add this line to your `~/.zshrc` file to make it permanent.

### "Permission denied" errors

Never run `brew` with `sudo`. If you're seeing permission errors, Homebrew's permissions may need repair:

```bash
sudo chown -R $(whoami) $(brew --prefix)/*
```

### Application won't open ("unidentified developer")

macOS Gatekeeper may block apps the first time. Right-click the app in Finder, select "Open", then click "Open" in the dialog. You only need to do this once per app.

### Still stuck?

- [Homebrew Documentation](https://docs.brew.sh)
- [Homebrew Troubleshooting](https://docs.brew.sh/Troubleshooting)
- [Open an issue](https://github.com/gm5dna/homebrew-amateur-radio/issues) for problems specific to this tap

## License

This tap is open source. Individual packages maintain their own licenses—check each package's homepage for details.
