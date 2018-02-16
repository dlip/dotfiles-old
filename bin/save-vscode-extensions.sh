
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/install-functions.sh

# Install Visual Studio Code extensions
if which code &> /dev/null; then
    echo "Saving Visual Studio Code extensions..."
    code --list-extensions > "$DOTFILES_DIR/vscode/extensions"
else
    echo "Visual Studio Code doesn't exist, can't save extensions"
fi
