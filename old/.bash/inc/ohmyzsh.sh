ohmyzsh_install() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        run "git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh"
    fi
    if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel9k" ]; then
        run "git clone https://github.com/bhilburn/powerlevel9k.git $HOME/.oh-my-zsh/custom/themes/powerlevel9k"
    fi
}

ohmyzsh_update() {
    run "cd $HOME/.oh-my-zsh && git pull"
    run "cd $HOME/.oh-my-zsh/custom/themes/powerlevel9k && git pull"
}