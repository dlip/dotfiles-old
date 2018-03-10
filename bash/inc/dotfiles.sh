#!/bin/bash

function dotfiles_install() {
  set -e
  IGNORE_FILES=(README.md vscode Brewfile install.sh)
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  DRY_RUN=$1

  bashit_install
  tpm_install
  spacevim_install
  vscode_install_extensions

  case $(uname) in
    'Darwin')
      brew_install
    ;;
  esac

  # Create symlinks for all files except those in $IGNORE_FILES
  for FILE in $(dotfiles_dir)/*; do
      BASE_FILENAME=$(basename $FILE)
      if ! array_contains IGNORE_FILES $BASE_FILENAME; then
          create_symlink $FILE $HOME/.$BASE_FILENAME
      fi
  done

  # OS Specific symlinks
  case $(uname) in
    'Linux')
      create_dir "$HOME/.config/Code/User"
      create_symlink "$(dotfiles_dir)/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
      ;;
    MINGW*)
      create_dir "$APPDATA/Code"
      create_symlink "$(dotfiles_dir)/vscode" "$APPDATA/Code/User"
      ;;
    'Darwin')
      create_dir "$HOME/Library/Application Support/Code/User"
      create_symlink "$(dotfiles_dir)/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
    ;;
  esac
}
