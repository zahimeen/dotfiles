#!/bin/zsh

unsetopt BEEP
unsetopt menu_complete

autoload -U +X bashcompinit && bashcompinit
autoload -U compinit && compinit
autoload edit-command-line; zle -N edit-command-line

setopt appendhistory
setopt autocd
setopt complete_in_word
setopt extendedglob 
setopt histignorealldups
setopt histignorespace
setopt incappendhistory
setopt interactive_comments
setopt menucomplete
setopt nobeep
setopt nocheckjobs
setopt nomatch

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $HOME/.cache/zsh
zstyle ':completion:*' menu select

zmodload -i zsh/complist
zmodload zsh/complist

WORDCHARS=${WORDCHARS//\/[&.;]}
HISTFILE=$HOME/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000
