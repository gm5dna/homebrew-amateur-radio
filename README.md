# homebrew-amateur-radio

[![CI](https://github.com/gm5dna/homebrew-amateur-radio/actions/workflows/ci.yml/badge.svg)](https://github.com/gm5dna/homebrew-amateur-radio/actions/workflows/ci.yml)

A Homebrew tap providing macOS software for amateur radio operators.

## New to Homebrew?

[Homebrew](https://brew.sh) is a popular open-source package manager for macOS. It provides a convenient way to install and update software from the command line.

To install Homebrew, open Terminal and run:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the post-install instructions to add `brew` to your PATH.

## Installation

```bash
brew tap gm5dna/amateur-radio
brew install <name>
```

For example:

```bash
brew install wsjtx
brew install nanovnasaver
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

## Uninstalling

```bash
brew uninstall <name>
brew uninstall --zap <name>  # also removes preferences and support files
```

## Troubleshooting

### "command not found: brew"

On Apple Silicon Macs, run:

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Add this to `~/.zshrc` to make it permanent.

### Application won't open (Gatekeeper)

Right-click the app in Finder, select "Open", then click "Open" in the dialog.

### More help

- [Homebrew Documentation](https://docs.brew.sh)
- [Open an issue](https://github.com/gm5dna/homebrew-amateur-radio/issues) for problems with this tap

## License

This tap is open source. Individual packages maintain their own licenses—check each package's homepage for details.
