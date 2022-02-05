#!/bin/zsh

# Enable Colors
autoload -U compinit colors zcalc
compinit -d
colors

# `LESS`
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R

# Autosuggestions 
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

# History Substring Search
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=6,bold"
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="fg=1,bold"

# Cursor
_fix_cursor() {
   echo -ne '\e[6 q'
}
precmd_functions+=(_fix_cursor)

# Prompt
eval "$(starship init zsh)"
