
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/install-functions.sh

# Install Visual Studio Code extensions
if which code &> /dev/null; then
    echo "Installing Visual Studio Code extensions..."
    INSTALL_EXTENSIONS=(`cat $DOTFILES_DIR/vscode/extensions | tr '\n' ' '`)
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