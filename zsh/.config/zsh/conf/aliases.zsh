if pacman -Qs exa > /dev/null ; then
    alias ls='exa -a --color=always --sort=type'
else
    alias ls='ls -a --color --sort=version'
fi
alias rls="clear ; ls"
if pacman -Qs ripgrep > /dev/null ; then
    alias grep='rg'
fi
alias rm="rm -i"
alias mkdir="mkdir -p"

##  GIT  ##

if pacman -Qs git > /dev/null ; then
    alias gs='git status'
    alias gc='git commit'
    alias gcm='git commit -m'
    alias gp='git push'
    alias ga='git add'
    alias gb='git checkout'
fi

##  NVIM TYPING ERRORS  ##

alias nimv="nvim"
alias nivm="nvim"
alias vnim="nivm"

