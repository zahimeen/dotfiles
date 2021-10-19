#!/bin/zsh

autoload -U colors && colors
setopt prompt_subst

eval "$(starship init zsh)"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#555555"
