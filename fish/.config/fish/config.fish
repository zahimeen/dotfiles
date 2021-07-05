###  STARTUP  ###

set fish_greeting

###  EXPORTS  ###

set -gx TERM "xterm-256color"
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml

###  ALIASES  ###

# spark
# alias clear='/bin/clear; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo'

# replacing `ls` with `exa`
alias ls='exa -a --color=always --sort=type'
alias rls="clear ; ls"

# confirm before performing action
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# git
alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias ga='git add'
alias gb='git checkout'

# neovim typing errors
alias nimv="nvim"
alias nivm="nvim"
alias vnim="nivm"
alias nvm="nvim"

###  STARTUP  ###

# echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo

# vim: filetype=fish
