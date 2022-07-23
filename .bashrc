#!/bin/bash

# we don't want a bell
bind 'set bell-style none'

# setting environment variables
export EDITOR="nvim"
export VISUAL="nvim"
export GPG_TTY=$(tty)

# aliases
alias ls="ls -a --color=always --sort=version"
alias rls="clear; ls"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# set prompt
if [ "$TERM" == "alacritty" ]; then
    eval "$(starship init bash)"
else
    PS1='\e[0;34m\u\e[m \e[0;36m\W \e[m'
fi

# vim: ft=sh
