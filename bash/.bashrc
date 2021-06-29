#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERM="xterm-256color"
export EDITOR="nvim"
export VISUAL="nvim"

alias ls='ls -a --color=always --sort=version'
alias rls="clear ; ls"
alias rm="rm -i"
alias mkdir="mkdir -p"

alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias ga='git add'
alias gb='git checkout'

alias nimv="nvim"
alias nivm="nvim"
alias vnim="nivm"

bind 'set bell-style none'  # disables error bell

PS1='\e[0;32m\u\e[m: \e[0;34m\W \e[m'
