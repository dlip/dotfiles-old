DRY_RUN=$1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -L $DIR ]; then
    DIR="$(readlink $DIR)"
fi

DOTFILES_DIR="$(dirname $DIR)"

function run
{
    if [ "$DRY_RUN" == "--dryrun" ]; then
        echo "DRY_RUN: $1"
    else
        echo $1
        eval $1
    fi
    
}

function array_contains () {
  local array="$1[@]"
  local seeking=$2
  local in=1
  for element in "${!array}"; do
    if [[ $element == $seeking ]]; then
      in=0
      break
    fi
  done
  return $in
}

function create_symlink () {
    FROM=$1
    TO=$2
    if [ -e "$TO" ] && [ "$(readlink "$TO")" != "$FROM" ]; then
        run "rm -rf \"$TO\""
    fi
    if [ ! -e "$TO" ]; then
        run "ln -s \"$FROM\" \"$TO\""
    fi
}

function create_dir () {
    if [ ! -d "$1" ]; then
        run "mkdir -p $1"
    fi
}