#!/usr/bin/env bash

for file in ~/.bash/{functions,exports,aliases,completion}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

proxy_check
