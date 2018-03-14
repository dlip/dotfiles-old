# dlip's dotfiles

## Features

* Compatible with Linux/Mac/Windows (git bash)
* Symlinks the files so you don't have a .git folder in your home directory
* [VSCode](https://code.visualstudio.com/) package save/install
* [Bash-it](https://github.com/Bash-it/bash-it) for bash config
* [oh-my-zsh](http://ohmyz.sh/) for zsh config
* [SpaceVim](https://spacevim.org/) for vim config
* [Homebrew](https://brew.sh/) for Mac package save/install

## Installation

```sh
https://github.com/dlip/dotfiles.git
cd dotfiles
# Check what it will change
DRY_RUN=true ./install.sh
# Install for real
./install.sh
# Start a new shell
# Enable bash completion
bashit_enable_completion
# If you like zsh instead of bash
chsh -s /bin/zsh
```