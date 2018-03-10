DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/install-functions.sh

run "rm -f '$DOTFILES_DIR/Brewfile'"
run "brew bundle dump --file='$DOTFILES_DIR/Brewfile'"
