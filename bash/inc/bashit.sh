bashit_install() {
  if [ ! -d "$HOME/.bash_it" ]; then
    run "git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it"
  fi
}

bashit_enable_completion() {
  bash-it enable completion all
  bash-it disable completion conda
  bash-it disable completion ng
}

bashit_update() {
    run "cd $HOME/.bash_it && git pull"
}