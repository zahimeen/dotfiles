export ZSH="/home/zahin/.oh-my-zsh"

plugins=(git archlinux zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export TERM="xterm-256color"
export EDITOR="devour emacsclient -c -a 'emacs'"
export VISUAL="nvim"

alias l='exa -al --color=always --group-directories-first'
alias ls='exa -al --color=always --group-directories-first'
alias grep='rg'
alias cat='bat'
alias rm="rm -i"

alias em="devour emacsclient -c -a 'emacs'"
alias emdebug="/usr/bin/emacs --debug-init"
alias emrestart="/usr/bin/emacs --daemon"

alias rls="clear ; ls"

eval "$(starship init zsh)"
