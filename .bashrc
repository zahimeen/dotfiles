# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa -al --color=always --group-directories-first'
alias grep='rg'
alias cat='bat'

alias note='nvim ~/vimwiki/index.wiki'

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
