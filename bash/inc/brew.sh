function brew_install() {
    case $(uname) in
        'Darwin')
        if ! which brew &> /dev/null; then
            run 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
        fi

        run "brew bundle --no-upgrade --file='$(dotfiles_dir)/nolink/Brewfile'"
        ;;
    esac
    
}

function brew_save() {
    run "rm -f '$(dotfiles_dir)/Brewfile'"
    run "brew bundle dump --file='$(dotfiles_dir)/nolink/Brewfile'"
}

function brew_update() {
    run "brew upgrade"
}