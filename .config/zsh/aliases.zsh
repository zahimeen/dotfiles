alias r='clear'
alias ls='exa -al --color=always --group-directories-first'
alias rls="clear ; ls"
alias grep='rg'
alias cat='bat'
alias rm="rm -i"

##  GIT  ##

alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias ga='git add'
alias gb='git checkout'

##  NVIM TYPING ERROR FIX  ##

alias nimv="nvim"
alias nivm="nvim"
alias vnim="nivm"

##  EMACS  ##

alias emacs="devour emacs"
alias em="devour emacsclient -c -a 'emacs'"
alias emdebug="/usr/bin/emacs --debug-init"
alias emrestart="/usr/bin/emacs --daemon"

# DOOM #

alias doom="$HOME/.emacs.d/bin/doom"
