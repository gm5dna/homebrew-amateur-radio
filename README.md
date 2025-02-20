# homebrew-amateur-radio

This is a custom Homebrew tap containing macOS software for amateur radio that I use frequently. It includes both formulae and casks for various tools and utilities to enhance your ham radio experience on macOS.

## Setting Up Homebrew

To get started with Homebrew, follow the official installation instructions here: [https://brew.sh](https://brew.sh)

Once Homebrew is installed, you can add this tap to your setup by running the following command:

```bash
brew tap gm5dna/amateur-radio
```

## Available Software

### Formulae
- **qttermtcp**: A terminal emulator for packet radio including linbpq.

### Casks
- **freedv**: FreeDV is a digital voice mode for HF radio.
- **js8call**: Digital communication software for weak-signal operators using JS8 mode.
- **pine64-updater**: A utility for updating Pine64 devices.
- **sdrconnect**: Software for interfacing with SDRplay devices.
- **waveloggate**: Connector software for wavelog.
- **wsjtx-improved**: A modified version of WSJT-X, software for weak signal communication.

## Installing Software

To install any of the software from this tap, simply run:

```bash
brew install <formula_or_cask_name>
```

For example, to install **freedv**, use:

```bash
brew install --cask freedv
```

## Contributing

If you'd like to contribute or suggest new software for inclusion in this tap, feel free to open an issue or a pull request.