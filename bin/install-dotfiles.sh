#!/bin/bash

set -e
IGNORE_FILES=(README.md vscode)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/install-functions.sh

# Create symlinks for all files except those in $IGNORE_FILES
for FILE in $DOTFILES_DIR/*; do
    BASE_FILENAME=$(basename $FILE)
    if ! array_contains IGNORE_FILES $BASE_FILENAME; then
        create_symlink $FILE $HOME/.$BASE_FILENAME 
    fi
done

# OS Specific symlinks
case $(uname) in
  'Linux')
    create_dir "$HOME/.config/Code/User"
    create_symlink "$DOTFILES_DIR/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
    ;;
  MINGW*)
    create_dir "$APPDATA/Code"
    create_symlink "$DOTFILES_DIR/vscode" "$APPDATA/Code/User"
    ;;
  'Darwin') 
    create_dir "$HOME/Library/Application Support/Code/User"
    create_symlink "$DOTFILES_DIR/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
   ;;
esac

$DIR/install-bash-it.sh $1
$DIR/install-vscode-extensions.sh $1
