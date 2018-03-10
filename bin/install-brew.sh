DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/install-functions.sh

if ! which brew &> /dev/null; then
    run 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
fi

run "brew bundle --file='$DOTFILES_DIR/Brewfile'"