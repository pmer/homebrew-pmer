# Paul's Homebrew Tap

These are some personal Homebrew formulae I maintain for personal use.

## Installation

To add this tap and make its formulae available to you:

```
brew tap pmer/pmer
```

All the formulae names are prefixed with `pmer-` for easy recognition.

```
brew remove vim  # If installed...
brew install pmer-vim --HEAD
```

## Uninstallation

To remove this tap and go back to your previous versions:

```
brew remove pmer-vim
brew untap pmer/pmer
brew install vim  # To reinstall the standard Homebrew version...
```

## Upgrading formula to new versions

Homebrew can't upgrade HEAD formulas—it's [a known issue](
https://github.com/Homebrew/legacy-homebrew/issues/13197).
Use reinstall to upgrade forumlae from pmer.

```
brew reinstall pmer-vim --HEAD
```

# Formulae List

- [pmer-vim](https://github.com/pmer/vim)
- [pmer-macvim](https://github.com/pmer/macvim)
