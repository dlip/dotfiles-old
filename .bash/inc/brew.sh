brew_install() {
    case $(uname) in
        'Darwin')
        if ! which brew &> /dev/null; then
            run 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
        fi
        if ! brew bundle check --no-upgrade --file="$(dotfiles_dir)/nolink/Brewfile" &> /dev/null; then
            run "brew bundle --no-upgrade --file='$(dotfiles_dir)/nolink/Brewfile'"
        fi
        ;;
    esac
    
}

brew_cleanup() {
    run "brew bundle cleanup --force --file='$(dotfiles_dir)/nolink/Brewfile'"
}

brew_save() {
    run "rm -f '$(dotfiles_dir)/nolink/Brewfile'"
    run "brew bundle dump --file='$(dotfiles_dir)/nolink/Brewfile'"
}

brew_update() {
    run "brew upgrade"
}
