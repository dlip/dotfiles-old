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

bashit_benchmark() {
  subdirectory="$1"

  if [ ! -d "${BASH_IT}/${subdirectory}/enabled" ]
  then
    continue
  fi
  FILES="${BASH_IT}/${subdirectory}/enabled/*.bash"
  OUTPUT=$(for config_file in $FILES
  do
    if [ -e "${config_file}" ]; then
      echo `{ time source $config_file >/dev/null; } 2>&1 | grep real | cut -f 2` ${config_file}'\n'
    fi
  done)
  OUTPUT=$(echo $OUTPUT | sed 's/\\n /\\n/g')
  echo -e $OUTPUT | sort -r
}
