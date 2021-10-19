#!/bin/zsh

zmodload -i zsh/complist
zmodload zsh/complist
zstyle ':completion:*' menu select

unsetopt BEEP
unsetopt menu_complete

setopt complete_in_word
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments

autoload -U +X bashcompinit && bashcompinit
autoload -U compinit && compinit
autoload edit-command-line; zle -N edit-command-line

