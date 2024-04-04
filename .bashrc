#!/bin/bash

# we don't want a bell
bind 'set bell-style none'

# setting environment variables
export EDITOR="nvim"
export VISUAL="nvim"
export GPG_TTY=$(tty)

# aliases
alias nivm="nvim"
alias vnim="nvim"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
if hash eza 2>/dev/null; then
	alias ls="eza -a --color=always --sort=type"
else
	alias ls="ls -a --color=always --sort=version"
fi

# checks if starship exists
if hash starship 2>/dev/null; then
    eval "$(starship init bash)"
else
    PS1='\e[0;34m\u\e[m \e[0;36m\W \e[m'
fi
