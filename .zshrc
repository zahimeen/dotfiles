#!/bin/zsh

# imagine actually using this
unsetopt BEEP

# allow the use of colors
autoload -U compinit colors zcalc
compinit -d
colors

# set environment variables
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
if [[ "$TERM" == "alacritty" ]]; then
    eval "$(starship init zsh)"
else
    PS1='\e[0;34m\u\e[m \e[0;36m\W \e[m'
fi

# vim: ft=sh
