#!/bin/zsh

export EDITOR="vim"
export VISUAL="vim"
export GPG_TTY=$(tty)

alias ls='ls -a --color=always --sort=version'
alias rls="clear; ls"

alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -S'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'
alias tag='git tag'
alias newtag='git tag -a'

if [ "$TERM" = "linux" ] || [ command -v starship &> /dev/null ]; then
    PROMPT='%n %1d $ '
else
    eval "$(starship init bash)"
fi
