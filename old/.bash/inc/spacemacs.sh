spacemacs_install() {
    if [ ! -d $HOME/.emacs.d ]; then
      run 'git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d'
    fi
}

spacemacs_update() {
    run 'cd $HOME/.emacs.d && git pull'
}