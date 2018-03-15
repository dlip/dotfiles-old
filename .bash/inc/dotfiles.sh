#!/bin/bash

dotfiles_install() {
    set -e
    set -u

    gitconfig_install
    bashit_install
    ohmyzsh_install
    tpm_install
    spacevim_install
    brew_install
    vscode_install
    plist_install
    dotfiles_symlink
}

dotfiles_symlink() {
    # Create symlinks for all files except those in $IGNORE_FILES
    IGNORE_FILES=(. .. .git .gitignore)
    for FILE in $DOTFILES_DIR/.*; do
        BASE_FILENAME=$(basename $FILE)
        if ! array_contains IGNORE_FILES $BASE_FILENAME; then
            create_symlink $FILE $HOME/$BASE_FILENAME
        fi
    done
}

dotfiles_update() {
    bashit_update
    ohmyzsh_update
    tpm_update
    spacevim_update
    brew_update
}