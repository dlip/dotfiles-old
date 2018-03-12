# dlip's dotfiles

## Features

* Compatible with Linux/Mac/Windows (git bash)
* Symlinks the files so you don't have a .git folder in your home directory
* [VSCode](https://code.visualstudio.com/) package save/install
* [Bash-it](https://github.com/Bash-it/bash-it) for bash config
* [SpaceVim](https://spacevim.org/) for vim config
* [Homebrew](https://brew.sh/) for Mac pacage save/install

## Installation

```sh
https://github.com/dlip/dotfiles.git
cd dotfiles
# Check what it will change
DRY_RUN=true ./install.sh
# Install for real
./install.sh
# Start a new shell then
# Enable bash completion
bashit_enable_completion
```