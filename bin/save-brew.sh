DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/install-functions.sh

EXISTING=$(brew info --json=v1 $(brew list))

RESULT=$(echo $EXISTING | jq -r 'map(select(.installed[0].installed_on_request == true)) | map({name: .name, options: .installed[0].used_options}) | map(. | flatten | join (" "))  | flatten | join (",")')

echo $RESULT | tr , '\n' > "$DOTFILES_DIR/brew/brew"
brew cask list >  "$DOTFILES_DIR/brew/cask"