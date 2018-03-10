#!/bin/bash

function dotfiles_install() {
  set -e
  set -u
  
  IGNORE_FILES=(README.md install.sh nolink)
  DRY_RUN=${1:-}

  bashit_install
  tpm_install
  spacevim_install
  vscode_install
  brew_install

  # Create symlinks for all files except those in $IGNORE_FILES
  for FILE in $(dotfiles_dir)/*; do
      BASE_FILENAME=$(basename $FILE)
      if ! array_contains IGNORE_FILES $BASE_FILENAME; then
          create_symlink $FILE $HOME/.$BASE_FILENAME
      fi
  done
}
