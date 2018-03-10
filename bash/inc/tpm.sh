function tpm_install() {
  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    run "mkdir $HOME/.tmux/plugins"
    run "git clone --depth=1 https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm"
  fi
}

function tpm_update() {
  run "cd $HOME/.tmux/plugins/tpm && git pull"
}