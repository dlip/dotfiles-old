spacevim_install() {
    if [ ! -d $HOME/.SpaceVim ]; then
      run 'curl -sLf https://spacevim.org/install.sh | bash'
    fi
}

spacevim_update() {
    run 'cd $HOME/.SpaceVim && git pull'
}