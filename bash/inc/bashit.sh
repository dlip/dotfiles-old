function bashit_install() {
  if [ ! -d "$HOME/.bash_it" ]; then
    run "git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it"
  fi
}

function bashit_update() {
    run "cd $HOME/.bash_it && git pull"
}