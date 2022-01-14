#!/bin/zsh

export OMZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZDOTDIR/custom"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $OMZSH/oh-my-zsh.sh
for file in $ZDOTDIR/conf/*; do source $file; done
