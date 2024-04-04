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

# prompt
if hash starship 2>/dev/null; then
    eval "$(starship init zsh)"
else
	PS1="%F{blue}%n${RESET} %F{cyan}%~ %f"
fi

# vim: ft=sh
