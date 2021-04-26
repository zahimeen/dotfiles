export ZSH="/home/zahin/.oh-my-zsh"

plugins=(git archlinux zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export TERM="xterm-256color"
export EDITOR="nvim"
export VISUAL="nvim"

alias l='exa -al --color=always --group-directories-first'
alias ls='exa -al --color=always --group-directories-first'
alias grep='rg'
alias cat='bat'
alias rm="rm -i"

alias emacs="devour emacsclient -c -a 'emacs'"

# alias nvim='devour neovide'
# alias note='devour neovide ~/vimwiki/index.wiki'
# alias note='nvim ~/vimwiki/index.wiki'

eval "$(starship init zsh)"

neofetch
