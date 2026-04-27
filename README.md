# homebrew-amateur-radio

[![CI](https://github.com/gm5dna/homebrew-amateur-radio/actions/workflows/ci.yml/badge.svg)](https://github.com/gm5dna/homebrew-amateur-radio/actions/workflows/ci.yml)

Native macOS builds and pre-packaged apps for amateur radio.

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
brew install wsjtx          # cask (GUI app)
brew install nanovnasaver   # formula (built from source)
```

Homebrew chooses formula or cask automatically when the name is unambiguous. If a name collides with a package in homebrew-core (e.g. `wsjtx`), use the fully-qualified form to be explicit:

```bash
brew install gm5dna/amateur-radio/wsjtx
```

## Available Software

### Formulae

| Name | Description |
|------|-------------|
| [**cloudlogcatqt**](https://github.com/myzinsky/CloudLogCatQt) | CAT control interface for Cloudlog logging |
| [**nanovnasaver**](https://github.com/NanoVNA-Saver/nanovna-saver) | Tool for reading, displaying, and saving data from NanoVNA analyzers |
| [**pat**](https://github.com/la5nta/pat) | Winlink client for emergency communications (native Apple Silicon build) |
| [**qttermtcp**](https://github.com/gm5dna/QtTermTCP) | Terminal emulator for packet radio communication by John Wiseman G8BPQ |
| [**voacapl**](https://github.com/jawatson/voacapl) | HF propagation prediction engine (port of VOACAP) |
| [**wsjtz**](https://github.com/sq9fve/wsjt-z) | Weak-signal digital communication with automation features |
| [**xastir**](https://github.com/Xastir/Xastir) | APRS client with mapping and weather alert support |

### Casks

#### Digital Modes & Weak Signal

| Name | Description |
|------|-------------|
| [**cocoamodem**](https://www.w7ay.net/site/Applications/cocoaModem/) | Amateur radio modem for RTTY, PSK31, MFSK, and other digital modes |
| [**freedv**](https://freedv.org/) | Open-source HF digital voice modem and GUI |
| [**js8call**](https://js8call.com/) | Weak-signal keyboard-to-keyboard messaging built on FT8 |
| [**js8call-improved**](https://github.com/JS8Call-improved/JS8Call-improved) | Enhanced JS8Call with bug fixes and additional features |
| [**jtdx**](https://www.jtdx.tech/) | FT8, JT65, JT9, and T10 digital modes software |
| [**wsjtx**](https://physics.princeton.edu/pulsar/k1jt/wsjtx.html) | Weak-signal digital communication using FT8, FT4, JT65, and WSPR modes |
| [**wsjtx-improved**](https://sourceforge.net/projects/wsjt-x-improved/) | Enhanced WSJT-X with additional features |
| [**wsjtx-improved-alt**](https://sourceforge.net/projects/wsjt-x-improved/) | WSJT-X Improved with alternative layout |
| [**wsjtx-improved-ws**](https://sourceforge.net/projects/wsjt-x-improved/) | WSJT-X Improved with widescreen layout |

#### Logging & QSL Management

| Name | Description |
|------|-------------|
| [**aether**](https://www.aetherlog.com/) | Ham radio logger with rig control, awards tracking, and QSL management |
| [**hamrs**](https://www.hamrs.app/) | Portable amateur radio logger for Parks on the Air, Field Day, and SOTA |
| [**jlog**](https://jlog.org/) | Cross-platform logger with LoTW, eQSL, and ClubLog integration |
| [**netlogger**](https://www.netlogger.org/) | Amateur radio net logging and real-time net monitoring |
| [**qlog**](https://github.com/aa5sh/QLog) | Amateur radio logbook with DX cluster, rig control, and online log integration |
| [**rumlogng**](https://dl2rum.de/) | Amateur radio logger with QSL management and DX tracking |
| [**skookumlogger**](https://www.k1gq.net/SkookumLogger/) | Advanced contest logging by K1GQ |
| [**waveloggate**](https://github.com/wavelog/WaveLogGate) | Gateway utility for WaveLog logging software |

#### SDR & Transceiver Control

| Name | Description |
|------|-------------|
| [**ft710-cockpit**](https://w0xz.com/ft-710/) | Controller for the Yaesu FT-710 transceiver |
| [**ftdx10-cockpit**](https://w0xz.com/ftdx10/) | Controller for the Yaesu FTdx10 transceiver |
| [**qttinysa**](https://github.com/g4ixt/QtTinySA) | Control software for the TinySA spectrum analyzer |
| [**sdr-angel**](https://github.com/f4exb/sdrangel) | Software-defined radio with extensive device support |
| [**sdrconnect**](https://www.sdrplay.com/) | SDR application for SDRplay receivers with spectrum analysis |
| [**sdrplusplus**](https://github.com/AlexandreRouma/SDRPlusPlus) | Cross-platform open-source SDR receiver application (nightly build) |
| [**sdrplusplus-brown**](https://github.com/sannysanoff/SDRPlusPlusBrown) | SDR++ fork with FT8/FT4 decoders, noise reduction, SSB TX, remote monitoring |
| [**sparksdr**](https://www.sparksdr.com/) | SDR application for Hermes Lite and OpenHPSDR-compatible radios |
| [**wfview**](https://wfview.org/) | Open source interface for Icom and Kenwood transceivers |
| [**wfview-beta**](https://github.com/eliggett/wfview/releases) | wfview Qt6 universal beta builds — tracks upstream master |

#### Antenna Modeling

| Name | Description |
|------|-------------|
| [**cocoanec**](https://www.w7ay.net/site/Applications/cocoaNEC/) | NEC-2 antenna modeling application |

#### Utilities

| Name | Description |
|------|-------------|
| [**hamclock-launcher**](https://github.com/huberthickman/HamClockLauncher) | Launcher for the HamClock application |
| [**hf-autopilot**](https://w0xz.com/autopilot/) | Quick tuning to POTA, SOTA, and NetLogger HF spots for HF radios |
| [**pine64-updater**](https://github.com/pine64/pine64_updater) | Updater for Pine64 devices (Pinecil, etc.) |
| [**rf-toolbox**](https://www.blackcatsystems.com/software/electronics-antenna-design-software.html) | Antenna design and electronics calculator |

## Updating

```bash
brew update
brew upgrade
```

Some casks self-update internally (e.g. SDR++ nightly builds). To force Homebrew to re-pull those, add `--greedy`:

```bash
brew upgrade --greedy
```

## Uninstalling

For formulae:

```bash
brew uninstall <name>
```

For casks (use `--zap` to also remove preferences and support files):

```bash
brew uninstall --cask <name>
brew uninstall --cask --zap <name>
```

## Troubleshooting

**"command not found: brew"** — Homebrew isn't set up in your shell yet. The Homebrew installer shows instructions for this at the end. See [brew.sh](https://brew.sh) for details.

**App won't open / "unidentified developer"** — On macOS 15 (Sequoia) and later: launch the app once, dismiss the warning, then go to *System Settings → Privacy & Security* and click "Open Anyway" next to the blocked app. On older macOS: right-click the app in Finder → Open → click "Open" in the dialog.

**Other issues** — See [Homebrew docs](https://docs.brew.sh) or [open an issue](https://github.com/gm5dna/homebrew-amateur-radio/issues).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to add a formula or cask, update versions, or report issues.

## License

This tap is open source. Individual packages maintain their own licenses—check each package's homepage for details.
