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
| [**chirp**](https://chirpmyradio.com/) | Memory programming for amateur radio handhelds and mobiles — built from the GitHub master branch because Cloudflare blocks the official downloads |
| [**cloudlogcatqt**](https://github.com/myzinsky/CloudLogCatQt) | CAT control interface for Cloudlog logging |
| [**linbpq**](https://github.com/g8bpq/linbpq) | G8BPQ AX.25 packet switch (Linux/macOS port of BPQ32) |
| [**mshv**](https://github.com/vu2cpl/mshv-macos-port) | Weak-signal and meteor-scatter digital modes (FT8, FT4, FT2, JT65, Q65) |
| [**nanovnasaver**](https://github.com/NanoVNA-Saver/nanovna-saver) | Tool for reading, displaying, and saving data from NanoVNA analysers |
| [**pat**](https://github.com/la5nta/pat) | Winlink client for emergency communications |
| [**qttermtcp**](https://github.com/g8bpq/QtTermTCP) | Terminal emulator for packet radio communication by John Wiseman G8BPQ |
| [**rigprog**](https://github.com/gm5dna/open-rig-programmer) | Memory-channel programmer for Yaesu and Icom transceivers — command-line tool |
| [**samoyed**](https://github.com/doismellburning/samoyed) | Software modem/TNC for packet radio (Go port of Dire Wolf) |
| [**voacapl**](https://github.com/jawatson/voacapl) | HF propagation prediction engine (port of VOACAP) |
| [**wsjtx-improved-auto**](https://sourceforge.net/projects/wsjt-x-improved/) | WSJT-X Improved with an opt-in setting that re-arms Wait & Pounce after each logged QSO — built from upstream source with a local patch |
| [**wsjtz**](https://github.com/sq9fve/wsjt-z) | Weak-signal digital communication with automation features |
| [**xastir**](https://github.com/Xastir/Xastir) | APRS client with mapping and weather alert support |

### Digital modes & weak signal

| Name | Description |
|------|-------------|
| [**cocoamodem**](https://github.com/matpet/CocoaModem) | RTTY, PSK31, MFSK, and other digital modes — maintained fork of W7AY's cocoaModem (macOS 15+) |
| [**freedv**](https://freedv.org/) | Open-source HF digital voice modem and GUI |
| [**freedv-neo**](https://blog.marxy.org/p/freedv-neo.html) | Client for the FreeDV RADE V1 digital voice mode — independent build by VK3TPM, not an official FreeDV project release (macOS 14+) |
| [**js8call**](https://github.com/js8call/js8call) | Weak-signal keyboard-to-keyboard messaging built on FT8 *(Intel)* |
| [**js8call-improved**](https://github.com/JS8Call-improved/JS8Call-improved) | Enhanced JS8Call with bug fixes and additional features *(Apple Silicon)* |
| [**jtdx**](https://sourceforge.net/projects/jtdx/) | FT8, JT65, JT9, and T10 digital modes software |
| [**jttychat**](https://blog.marxy.org/p/jttychat-for-macos.html) | Chat client for the JTTY keyboard-to-keyboard digital mode in WSJT-X 3.2, by VK3TPM — macOS 27+ *(Apple Silicon)* |
| [**macwinlink**](https://github.com/jjones9527/macwinlink-releases) | Native Winlink email client with CAT rig control and VARA, ARDOP, and packet transports — public beta, macOS 15+ *(Apple Silicon)* |
| [**multimode**](https://www.blackcatsystems.com/software/multimode.html) | Multi-mode decoder for CW, RTTY, FAX, SSTV, NAVTEX, PSK31, and more *(Intel)* |
| [**nexus**](https://hamradiotools.io/) | All-mode station app with a needed-DX board, FT8/FT4/CW/RTTY/PSK, POTA/SOTA and an awards-tracking logbook (macOS 12+) *(Apple Silicon)* |
| [**open-sstv**](https://github.com/bucknova/Open-SSTV) | Open-source SSTV transceiver with rig control, QSO logbook, and image gallery — beta *(Apple Silicon)* |
| [**qtsoundmodem**](https://github.com/gm5dna/qtsoundmodem-macos-port) | AX.25 packet-radio soundmodem — port of UZ7HO's QtSoundModem *(Apple Silicon)* |
| [**rttytci**](https://github.com/dl1bz/rttyTCI) | RTTY transceiver app for SDRs using the TCI protocol |
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
| [**ham-tools**](https://toolbox.funkwelt.net/) | Logbook with CAT and DX cluster, plus WSPR, NEC2 antenna simulator, Winlink, SSTV and 30+ calculators — beta, macOS 14+ |
| [**hamrs**](https://www.hamrs.app/) | Portable amateur radio logger for Parks on the Air, Field Day, and SOTA |
| [**jlog-amateur-radio**](https://jlog.org/) | Cross-platform logger with LoTW, eQSL, and ClubLog integration |
| [**klog-amateur-radio**](https://github.com/ea4k/klog) | KLog: cross-platform logger with DX cluster, QSL and DXCC management, and Club Log upload (Apple Silicon build needs macOS 26+) |
| [**netlogger**](https://www.netlogger.org/) | Amateur radio net logging and real-time net monitoring *(Intel)* |
| [**opslog**](https://github.com/GregTroar/OpsLog) | Logger with CAT control for a dozen backends, DX cluster, awards, QSL designer and shared MySQL logbooks |
| [**qlog**](https://github.com/aa5sh/QLog) | Amateur radio logbook with DX cluster, rig control, and online log integration — macOS 26+ *(Apple Silicon)* |
| [**rumlogng**](https://dl2rum.de/) | Amateur radio logger with QSL management and DX tracking |
| [**skookumlogger**](https://www.k1gq.net/SkookumLogger/) | Advanced contest logging by K1GQ |
| [**ultimateaac**](https://epc-mc.eu/) | Award application centre for EPC, AGB, ERC and other digital-mode award programmes, reading your existing logbook |
| [**waveloggate**](https://github.com/wavelog/WaveLogGate) | Gateway utility for WaveLog logging software |

### SDR & transceiver control

| Name | Description |
|------|-------------|
| [**aethersdr**](https://www.aethersdr.com/) | Open-source client for FlexRadio 6000, 8000 and Aurora transceivers (macOS 14+) *(Apple Silicon)* |
| [**deskhpsdr**](https://github.com/dl1bz/deskhpsdr) | SDR app for OpenHPSDR protocol 1 and 2 transceivers (Apple Silicon build needs macOS 26+) |
| [**dogparksdr**](https://www.dogparksoftware.com/dogparkSDR.html) | Native client for FlexRadio Signature-series software-defined radios |
| [**ft710-cockpit**](https://w0xz.com/ft-710/) | Controller for the Yaesu FT-710 transceiver |
| [**ftdx10-cockpit**](https://w0xz.com/ftdx10/) | Controller for the Yaesu FTdx10 transceiver |
| [**hermitsdr**](https://hermitsdr.com/) | Native client for Hermes-Lite 2, SquareSDR and ANAN openHPSDR radios, with FT8 and other digital-mode decoders *(Apple Silicon)* |
| [**htcommander**](https://github.com/Ylianst/HTCommander) | Controller for Benshi-family handhelds (BTech UV-Pro, Radioddity GA-5WB, Vero VR-N76/N7500) over Bluetooth |
| [**mac125**](https://gw3jvb.uk/software/mac125/) | Memory programmer for the Uniden UBC125XLT scanner |
| [**macdoppler**](https://www.dogparksoftware.com/MacDoppler.html) | Satellite tracking with Doppler tuning and rotator/antenna automation |
| [**onair**](https://github.com/adswill/OnAir) | SDR receiver for digital TV, DAB+, FM, DRM, aviation, satellites, GNSS and ham modes (FT8, PSK31, CW) |
| [**open-rig-programmer**](https://github.com/gm5dna/open-rig-programmer) | Memory-channel programmer for Yaesu and Icom transceivers — GUI; see the **rigprog** formula for the command-line tool |
| [**qk4**](https://mikeg-dal.github.io/QK4/) | Remote control for the Elecraft K4 and KPA1500 over the network, with panadapter, waterfall and Opus audio — beta *(Apple Silicon)* |
| [**sdc**](https://www.lw-sdc.com/) | Software Defined Connectors — CW/RTTY/PSK skimmers, rig sync, and audio routing for SDR software |
| [**sdr-angel**](https://github.com/f4exb/sdrangel) | Software-defined radio with extensive device support |
| [**sdrconnect**](https://www.sdrplay.com/) | SDR application for SDRplay receivers with spectrum analysis |
| [**sdroxide**](https://sdroxide.com/) | SDR Oxide: SDR transceiver client for CAT, TCI, HPSDR, RTL-SDR, SoapySDR and SDRplay radios, with skimmers, digital modes and Winlink |
| [**sdrplusplus**](https://github.com/AlexandreRouma/SDRPlusPlus) | Cross-platform open-source SDR receiver application (nightly build) |
| [**sdrplusplus-brown**](https://github.com/sannysanoff/SDRPlusPlusBrown) | SDR++ fork with FT8/FT4 decoders, noise reduction, SSB TX, remote monitoring |
| [**sigdigger**](https://batchdrake.github.io/SigDigger/) | Digital signal analyser and inspector for SDR *(Intel)* |
| [**sparksdr**](https://www.sparksdr.com/) | SDR application for Hermes Lite and OpenHPSDR-compatible radios |
| [**spectraflux**](https://rfspace.com/RFSPACE/SpectraFlux/) | Native SDR spectrum analyser with 3D waterfall and demodulation — rolling beta *(Apple Silicon)* |
| [**tx500-utility**](https://mikeg-dal.github.io/TX500Utility/) | CAT control, memory channels, settings backup, clock sync and firmware updates for the Lab599 TX-500 — beta, macOS 26+ *(Apple Silicon)* |
| [**wfview**](https://wfview.org/) | Open source interface for Icom, Kenwood, and Yaesu transceivers |
| [**wfview-beta**](https://wfview.org/) | wfview Qt6 universal beta builds — tracks upstream master |
| [**yaesu-web-control**](https://github.com/mm5agm/Yaesu_Web_Control) | Browser-based CAT controller for Yaesu HF transceivers — CAT only on macOS (no SDR spectrum) |
| [**zeus-link**](https://zeussdr.com/) | Launcher for the ZeusSDR OpenHPSDR station console — fetches the engine itself; needs a QRZ.com sign-in |

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
| [**qk-lp100a**](https://mikeg-dal.github.io/QK-LPA100A/) | Power, SWR and impedance display and Hamlib antenna sweeps for the TelePost LP-100A wattmeter — alpha, macOS 26+ *(Apple Silicon)* |
| [**qttinysa**](https://github.com/g4ixt/QtTinySA) | Control software for the TinySA spectrum analyser |
| [**saleae-logic**](https://www.saleae.com/) | Logic analyser and oscilloscope software for Saleae Logic devices |
| [**scanastudio**](https://www.ikalogic.com/) | Interface software for Ikalogic logic analysers and pattern generators |

### Utilities

| Name | Description |
|------|-------------|
| [**dx-toolbox**](https://www.blackcatsystems.com/software/ham-shortwave-radio-propagation-software.html) | Shortwave radio propagation and space-weather forecasting *(Intel)* |
| [**hamclock-launcher**](https://github.com/huberthickman/HamClockLauncher) | Launcher for the HamClock application |
| [**hf-autopilot**](https://w0xz.com/autopilot/) | Quick tuning to POTA, SOTA, and NetLogger HF spots for HF radios |
| [**mac-tci-dx-cluster**](https://gw3jvb.uk/software/mac-tci-dx-cluster/) | Telnet DX cluster client that forwards spots to TCI radio servers, with RUMlogNG worked/needed checks (macOS 14+) |
| [**morse-mania**](https://www.blackcatsystems.com/software/morse-code-practice-software.html) | CW (Morse code) training and practice tutor *(Intel)* |
| [**morse-runner**](https://mikeg-dal.github.io/MorseRunner-KF5O/) | CW contest simulator — native port of VE3NEA's Morse Runner |
| [**orbitdeck**](https://github.com/prstoetzer/OrbitDeck) | Satellite tracker with pass prediction, Doppler-corrected frequencies and link budgets *(Apple Silicon)* |
| [**pine64-updater**](https://github.com/pine64/pine64_updater) | Updater for Pine64 devices (Pinecil, etc.) *(Intel)* |
| [**qcluster**](https://qso365.co.uk/qcluster/) | DX cluster client with band, mode, entity and distance filtering and alerts, by G6NHU (macOS 14+) |
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
