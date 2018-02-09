#!/bin/bash

set -e
IGNORE_FILES=(README.md vscode)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DRY_RUN=$1

function run
{
    if [ "$DRY_RUN" == "--dryrun" ]; then
        echo "DRY_RUN: $1"
    else
        echo $1
        eval $1
    fi
    
}

function array_contains () {
  local array="$1[@]"
  local seeking=$2
  local in=1
  for element in "${!array}"; do
    if [[ $element == $seeking ]]; then
      in=0
      break
    fi
  done
  return $in
}

function create_symlink () {
    FROM=$1
    TO=$2
    if [ -e "$TO" ] && [ "$(readlink $TO)" != "$FROM" ]; then
        run "rm -rf \"$TO\""
    fi
    if [ ! -e "$TO" ]; then
        run "ln -s \"$FROM\" \"$TO\""
    fi
}

# Create symlinks for all files except those in $IGNORE_FILES
for FILE in $DIR/*; do
    BASE_FILENAME=$(basename $FILE)
    if ! array_contains IGNORE_FILES $BASE_FILENAME; then
        create_symlink $FILE $HOME/.$BASE_FILENAME 
    fi
done

# OS Specific symlinks
case $(uname) in
  'Linux')
    run "mkdir -p $HOME/.config/Code/User"
    create_symlink $DIR/vscode/settings.json "$HOME/.config/Code/User/settings.json"
    ;;
  'WindowsNT')
    ;;
  'Darwin') 
    run "mkdir -p $HOME/Library/Application Support/Code/User"
    create_symlink $DIR/vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
    ;;
esac

# Install Visual Studio Code extensions
if which code &> /dev/null; then
    echo "Installing Visual Studio Code extensions..."
    INSTALL_EXTENSIONS=(`cat vscode/extensions | tr '\n' ' '`)
    EXISTING_EXTENSIONS=(`code --list-extensions | tr '\n' ' '`)

    for EXTENSION in "${INSTALL_EXTENSIONS[@]}"; do
        if (! array_contains EXISTING_EXTENSIONS $EXTENSION); then
            run "code --install-extension $EXTENSION"
        fi
    done
    for EXTENSION in "${EXISTING_EXTENSIONS[@]}"; do
        if (! array_contains INSTALL_EXTENSIONS $EXTENSION); then
            run "code --uninstall-extension $EXTENSION"
        fi
    done
else
    echo "Visual Studio Code doesn't exist, skipping extension installation"
fi
