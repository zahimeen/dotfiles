export ZSH="/home/zahin/.oh-my-zsh"

plugins=(git archlinux zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export TERM="xterm-256color"
export EDITOR="nvim"
export VISUAL="nvim"

alias ls='exa -al --color=always --group-directories-first'
alias grep='rg'
alias cat='bat'
alias nvim='devour nvim'
alias note='devour nvim ~/vimwiki/index.wiki'

eval "$(starship init zsh)"

neofetch
