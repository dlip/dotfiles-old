brew_install() {
    if [ "$(uname)" == "Darwin" ]; then
        if ! which brew &> /dev/null; then
            run 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
        fi
        if ! brew bundle check --no-upgrade --file="$(dotfiles_dir)/Brewfile" &> /dev/null; then
            run "brew bundle --no-upgrade --file='$(dotfiles_dir)/Brewfile'"
        fi
    fi
    
}

brew_cleanup() {
    run "brew bundle cleanup --force --file='$(dotfiles_dir)/Brewfile'"
}

brew_save() {
    run "rm -f '$(dotfiles_dir)/Brewfile'"
    run "brew bundle dump --file='$(dotfiles_dir)/Brewfile'"
}

brew_update() {
    run "brew upgrade"
}
