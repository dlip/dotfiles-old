#!/bin/bash

set -e
IGNORE_FILES=(README.md)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


DRY_RUN=$1

function run
{
    if [ "$DRY_RUN" == "--dryrun" ]; then
        echo $1
    else
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

for FILE in $DIR/*; do
    BASE_FILENAME=$(basename $FILE)
    if ( ! array_contains IGNORE_FILES $BASE_FILENAME ); then
        if [ -e ~/.$BASE_FILENAME ]; then
            run "rm -rf ~/.$BASE_FILENAME"
        fi
        run "ln -s $FILE ~/.$BASE_FILENAME"
    fi
done


