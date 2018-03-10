#!/usr/bin/env bash

for file in ~/.bash/{functions,exports,aliases,completion}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

if [ -e $HOME/.proxy_enable ]; then
	proxy_enable
fi

# Load Bash It
source "$BASH_IT"/bash_it.sh

# Setup short git aliases
if function_exists __git_aliases; then
	for al in `__git_aliases`; do
			alias g$al="git $al"
			
			complete_func=_git_$(__git_aliased_command $al)
			function_exists $complete_fnc && __git_complete g$al $complete_func
	done
fi