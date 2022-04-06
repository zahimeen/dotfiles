#!/bin/zsh

# Better `ls` with `exa`
alias ls="exa -a --color=always --sort=type"
alias rls="clear; ls"

# Confirmation on File/Directory Moving Procedures
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# Git
alias addall="git add ."
alias branch="git branch"
alias checkout="git checkout"
alias clone="git clone"
alias commit="git commit -S"
alias fetch="git fetch"
alias pull="git pull origin"
alias push="git push origin"
alias stat="git status"
alias tag="git tag"
alias newtag="git tag -a"

# Miscellaneous
alias py="python"
alias vimex="vim -e"
