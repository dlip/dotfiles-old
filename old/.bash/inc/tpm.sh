tpm_install() {
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        run "mkdir -p $HOME/.tmux/plugins"
        run "git clone --depth=1 https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm"
    fi
}

tpm_update() {
    run "cd $HOME/.tmux/plugins/tpm && git pull"
}