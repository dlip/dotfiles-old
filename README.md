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

# If you like bash:
shell_bash
# Enable all completions
bashit_enable_completion

# If you like zsh:
shell_zsh

# Configure your shell in .env file
# Restart shell
```
## Post-install Tasks

### iTerm2

- Open iTerm2.
- Select iTerm2 > Preferences.
- Under the General tab, check the box labeled "Load preferences from a custom folder or URL:"
- Press "Browse" and point it to `~/.iterm2`.
- Restart iTerm2.

### Proxy

- Cntlm configuration is in /usr/local/etc/cntlm.conf
- After editing the configuration, run `brew services restart cntlm`
- In .env file there are proxy settings to use cntlm eg. BASH_IT_HTTP_PROXY
- Run `proxy_enable` to enable the proxy
- On mac make a network location called 'noproxy' in network preferences
- Run `proxy_disable` to disable the proxy