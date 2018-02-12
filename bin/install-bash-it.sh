DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/install-functions.sh

if [ ! -d "$HOME/.bash_it" ]; then
  run "git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it"
else
  run "cd $HOME/.bash_it && git pull"
fi