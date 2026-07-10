# homebrew-amateur-radio

[![CI](https://github.com/gm5dna/homebrew-amateur-radio/actions/workflows/ci.yml/badge.svg)](https://github.com/gm5dna/homebrew-amateur-radio/actions/workflows/ci.yml)

A [Homebrew](https://brew.sh) tap of native macOS builds and pre-packaged apps
for amateur radio: digital modes, SDR, logging, antenna modelling, and test
equipment.

## Quick start

```bash
brew tap gm5dna/amateur-radio
brew install wsjtx
```

Homebrew works out whether a name is a formula (built from source) or a cask
(pre-built app) automatically. If a name collides with another tap, use the
fully-qualified form:

```bash
brew install gm5dna/amateur-radio/wsjtx
```

<details>
<summary><strong>New to Homebrew?</strong></summary>

[Homebrew](https://brew.sh) is a popular open-source package manager for
macOS: a convenient way to install and update software from the command line.
To install it, open Terminal and run:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the post-install instructions to add `brew` to your PATH.

</details>

## Available software

Architecture notes: *(Intel)* marks Intel-only builds, which run on Apple
Silicon via Rosetta 2; *(Apple Silicon)* marks builds with no Intel version.
Everything else runs natively on both.

### Formulae (built from source)

| Name | Description |
|------|-------------|
| [**cloudlogcatqt**](https://github.com/myzinsky/CloudLogCatQt) | CAT control interface for Cloudlog logging |
| [**linbpq**](https://github.com/g8bpq/linbpq) | G8BPQ AX.25 packet switch (Linux/macOS port of BPQ32) |
| [**mshv**](https://github.com/dl1bz/mshv-macos-port) | Weak-signal and meteor-scatter digital modes (FT8, FT4, JT65, Q65) |
| [**nanovnasaver**](https://github.com/NanoVNA-Saver/nanovna-saver) | Tool for reading, displaying, and saving data from NanoVNA analysers |
| [**pat**](https://github.com/la5nta/pat) | Winlink client for emergency communications |
| [**qttermtcp**](https://github.com/g8bpq/QtTermTCP) | Terminal emulator for packet radio communication by John Wiseman G8BPQ |
| [**samoyed**](https://github.com/doismellburning/samoyed) | Software modem/TNC for packet radio (Go port of Dire Wolf) |
| [**voacapl**](https://github.com/jawatson/voacapl) | HF propagation prediction engine (port of VOACAP) |
| [**wsjtz**](https://github.com/sq9fve/wsjt-z) | Weak-signal digital communication with automation features |
| [**xastir**](https://github.com/Xastir/Xastir) | APRS client with mapping and weather alert support |

### Digital modes & weak signal

| Name | Description |
|------|-------------|
| [**cocoamodem**](https://github.com/matpet/CocoaModem) | RTTY, PSK31, MFSK, and other digital modes — maintained fork of W7AY's cocoaModem (macOS 15+) |
| [**freedv**](https://freedv.org/) | Open-source HF digital voice modem and GUI |
| [**js8call**](https://github.com/js8call/js8call) | Weak-signal keyboard-to-keyboard messaging built on FT8 *(Intel)* |
| [**js8call-improved**](https://github.com/JS8Call-improved/JS8Call-improved) | Enhanced JS8Call with bug fixes and additional features |
| [**jtdx**](https://sourceforge.net/projects/jtdx/) | FT8, JT65, JT9, and T10 digital modes software |
| [**macwinlink**](https://github.com/jjones9527/macwinlink-releases) | Native Winlink email client with CAT rig control and VARA, ARDOP, and packet transports — public beta, macOS 15+ *(Apple Silicon)* |
| [**multimode**](https://www.blackcatsystems.com/software/multimode.html) | Multi-mode decoder for CW, RTTY, FAX, SSTV, NAVTEX, PSK31, and more *(Intel)* |
| [**qtsoundmodem**](https://github.com/gm5dna/qtsoundmodem-macos-port) | AX.25 packet-radio soundmodem — port of UZ7HO's QtSoundModem *(Apple Silicon)* |
| [**rttytci**](https://github.com/dl1bz/rttyTCI) | RTTY transceiver app for SDRs using the TCI protocol *(Apple Silicon)* |
| [**sstv**](https://www.blackcatsystems.com/software/sstv.html) | Slow-scan television (SSTV) encoder and decoder *(Intel)* |
| [**sstv-beta**](https://www.blackcatsystems.com/software/sstv.html) | Black Cat SSTV beta — universal build for Apple Silicon and Intel |
| [**wsjtx**](https://wsjt.sourceforge.io/wsjtx.html) | Weak-signal digital communication using FT8, FT4, JT65, and WSPR modes |
| [**wsjtx-improved**](https://sourceforge.net/projects/wsjt-x-improved/) | Enhanced WSJT-X with additional features |
| [**wsjtx-improved-alt**](https://sourceforge.net/projects/wsjt-x-improved/) | WSJT-X Improved with alternative layout |
| [**wsjtx-improved-ws**](https://sourceforge.net/projects/wsjt-x-improved/) | WSJT-X Improved with widescreen layout |

### Fldigi suite (W1HKJ)

Companion apps to `fldigi`/`flrig` (both in Homebrew core). Installed with
clean names (e.g. `flmsg.app`) despite the version-stamped bundles upstream
ships.

| Name | Description |
|------|-------------|
| [**flaa**](https://www.w1hkj.org/) | Antenna-analyser control for RigExpert AA-series instruments *(Intel)* |
| [**flamp**](https://www.w1hkj.org/) | Amateur Multicast Protocol file transfer for the fldigi suite |
| [**flcluster**](https://www.w1hkj.org/) | DX telnet cluster client for the fldigi suite |
| [**fllog**](https://www.w1hkj.org/) | Logbook server shared across the fldigi suite over XML-RPC |
| [**flmsg**](https://www.w1hkj.org/) | NBEMS structured-message and forms editor for the fldigi suite |
| [**flnet**](https://www.w1hkj.org/) | Net-control roster and check-in logging for the fldigi suite |
| [**flwkey**](https://www.w1hkj.org/) | Control app for K1EL Winkeyer CW keyers |
| [**flwrap**](https://www.w1hkj.org/) | File encapsulation and checksums for radio file transfer |

### Logging & QSL management

| Name | Description |
|------|-------------|
| [**aether**](https://www.aetherlog.com/) | Ham radio logger with rig control, awards tracking, and QSL management |
| [**hamrs**](https://www.hamrs.app/) | Portable amateur radio logger for Parks on the Air, Field Day, and SOTA |
| [**jlog-amateur-radio**](https://jlog.org/) | Cross-platform logger with LoTW, eQSL, and ClubLog integration |
| [**netlogger**](https://www.netlogger.org/) | Amateur radio net logging and real-time net monitoring *(Intel)* |
| [**qlog**](https://github.com/aa5sh/QLog) | Amateur radio logbook with DX cluster, rig control, and online log integration |
| [**rumlogng**](https://dl2rum.de/) | Amateur radio logger with QSL management and DX tracking |
| [**skookumlogger**](https://www.k1gq.net/SkookumLogger/) | Advanced contest logging by K1GQ |
| [**waveloggate**](https://github.com/wavelog/WaveLogGate) | Gateway utility for WaveLog logging software |

### SDR & transceiver control

| Name | Description |
|------|-------------|
| [**deskhpsdr**](https://github.com/dl1bz/deskhpsdr) | SDR app for OpenHPSDR protocol 1 and 2 transceivers *(Apple Silicon)* |
| [**dogparksdr**](https://www.dogparksoftware.com/dogparkSDR.html) | Native client for FlexRadio Signature-series software-defined radios |
| [**ft710-cockpit**](https://w0xz.com/ft-710/) | Controller for the Yaesu FT-710 transceiver |
| [**ftdx10-cockpit**](https://w0xz.com/ftdx10/) | Controller for the Yaesu FTdx10 transceiver |
| [**macdoppler**](https://www.dogparksoftware.com/MacDoppler.html) | Satellite tracking with Doppler tuning and rotator/antenna automation |
| [**sdc**](https://www.lw-sdc.com/) | Software Defined Connectors — CW/RTTY/PSK skimmers, rig sync, and audio routing for SDR software |
| [**sdr-angel**](https://github.com/f4exb/sdrangel) | Software-defined radio with extensive device support |
| [**sdrconnect**](https://www.sdrplay.com/) | SDR application for SDRplay receivers with spectrum analysis |
| [**sdrplusplus**](https://github.com/AlexandreRouma/SDRPlusPlus) | Cross-platform open-source SDR receiver application (nightly build) |
| [**sdrplusplus-brown**](https://github.com/sannysanoff/SDRPlusPlusBrown) | SDR++ fork with FT8/FT4 decoders, noise reduction, SSB TX, remote monitoring |
| [**sigdigger**](https://batchdrake.github.io/SigDigger/) | Digital signal analyser and inspector for SDR *(Intel)* |
| [**sparksdr**](https://www.sparksdr.com/) | SDR application for Hermes Lite and OpenHPSDR-compatible radios |
| [**spectraflux**](https://rfspace.com/RFSPACE/SpectraFlux/) | Native SDR spectrum analyser with 3D waterfall and demodulation — rolling beta *(Apple Silicon)* |
| [**wfview**](https://wfview.org/) | Open source interface for Icom, Kenwood, and Yaesu transceivers |
| [**wfview-beta**](https://wfview.org/) | wfview Qt6 universal beta builds — tracks upstream master |

### Antenna modelling

| Name | Description |
|------|-------------|
| [**cocoanec**](https://www.w7ay.net/site/Applications/cocoaNEC/) | NEC-2 antenna modelling application *(Intel)* |
| [**matchmaker**](https://www.blackcatsystems.com/software/matchmaker-rf-impedance-matching-software.html) | RF impedance-matching network calculator *(Intel)* |
| [**mininec-pro**](https://www.blackcatsystems.com/software/mininec-antenna-analysis-modeling-software.html) | Antenna analysis and modelling using the MININEC engine *(Intel)* |

### Test equipment

| Name | Description |
|------|-------------|
| [**ispectrum**](https://www.dogparksoftware.com/iSpectrum.html) | Audio spectrum analyser with live frequency and waterfall display *(Intel)* |
| [**librevna**](https://github.com/jankae/LibreVNA) | GUI for the LibreVNA open-source USB vector network analyser (macOS 14+) |
| [**picoscope**](https://www.picotech.com/products/oscilloscope) | Oscilloscope software for PicoScope test-and-measurement hardware *(Intel)* |
| [**qttinysa**](https://github.com/g4ixt/QtTinySA) | Control software for the TinySA spectrum analyser |
| [**saleae-logic**](https://www.saleae.com/) | Logic analyser and oscilloscope software for Saleae Logic devices |
| [**scanastudio**](https://www.ikalogic.com/) | Interface software for Ikalogic logic analysers and pattern generators *(Intel)* |

### Utilities

| Name | Description |
|------|-------------|
| [**dx-toolbox**](https://www.blackcatsystems.com/software/ham-shortwave-radio-propagation-software.html) | Shortwave radio propagation and space-weather forecasting *(Intel)* |
| [**hamclock-launcher**](https://github.com/huberthickman/HamClockLauncher) | Launcher for the HamClock application |
| [**hf-autopilot**](https://w0xz.com/autopilot/) | Quick tuning to POTA, SOTA, and NetLogger HF spots for HF radios |
| [**morse-mania**](https://www.blackcatsystems.com/software/morse-code-practice-software.html) | CW (Morse code) training and practice tutor *(Intel)* |
| [**pine64-updater**](https://github.com/pine64/pine64_updater) | Updater for Pine64 devices (Pinecil, etc.) *(Intel)* |
| [**rf-toolbox**](https://www.blackcatsystems.com/software/electronics-antenna-design-software.html) | Antenna design and electronics calculator *(Intel)* |

## Updating

```bash
brew update
brew upgrade
```

Some casks self-update internally (e.g. SDR++ nightly builds). To force
Homebrew to re-pull those, add `--greedy`:

```bash
brew upgrade --greedy
```

## Uninstalling

```bash
brew uninstall <name>              # formula or cask
brew uninstall --cask --zap <name> # cask, also removing preferences and support files
```

## Troubleshooting

**"command not found: brew"** — Homebrew isn't set up in your shell yet. The
Homebrew installer shows instructions for this at the end. See
[brew.sh](https://brew.sh) for details.

**App won't open / "unidentified developer"** — On macOS 15 (Sequoia) and
later: launch the app once, dismiss the warning, then go to *System Settings →
Privacy & Security* and click "Open Anyway" next to the blocked app. On older
macOS: right-click the app in Finder → Open → click "Open" in the dialog.
Some casks print exact steps at install time — `brew info <name>` shows them
again.

**Other issues** — See the [Homebrew docs](https://docs.brew.sh) or
[open an issue](https://github.com/gm5dna/homebrew-amateur-radio/issues).

## License

This tap's metadata is released under the MIT License. Individual packages
maintain their own licences — check each package's homepage for details.
