ohmyzsh_install() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        run "git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh"
    fi
}

ohmyzsh_update() {
    run "cd $HOME/.oh-my-zsh && git pull"
}