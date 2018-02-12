
if [ ! -d "$HOME/.bash_it" ]; then
  git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
else
  cd $HOME/.bash_it
  git pull
fi