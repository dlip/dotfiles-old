#!/usr/bin/env bash


curl -s -L -o oh-my-zsh-master.tar.gz https://github.com/robbyrussell/oh-my-zsh/archive/master.tar.gz
chezmoi import --strip-components 1 --destination ${HOME}/.oh-my-zsh oh-my-zsh-master.tar.gz
curl -s -L -o powerlevel-9k.tar.gz https://github.com/Powerlevel9k/powerlevel9k/archive/master.tar.gz
chezmoi import --strip-components 1 --destination ${HOME}/.oh-my-zsh/custom/themes/powerlevel9k powerlevel-9k.tar.gz
