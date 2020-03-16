#!/bin/bash

ZSH_VERSION=${ZSH_VERSION:-}
if [ -n "$ZSH_VERSION" ]; then
    DIR="$( cd "$( dirname "${(%):-%N}" )" && pwd )"
elif [ -n "$BASH_VERSION" ]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi

source $DIR/.bash/functions
dotfiles_install $@
