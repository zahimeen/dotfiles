# replacing `ls` with `exa`
alias ls='exa -a --color=always --sort=type'
alias rls="clear ; ls"

# confirm before performing action
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# git
alias gs='git status'
alias gc='git commit -S'
alias gp='git push'
alias ga='git add'
alias gb='git checkout'

# neovim typing errors
alias nvim="lvim"
alias nimv="lvim"
alias nivm="lvim"
alias vnim="lvim"
alias nvm="lvim"

# stop writing 'python' in full
alias py="python"

# some cd aliases that make life 10 times easier
alias g="goto" # when yes
alias c="cd" # fast
alias d="cd" # fast
alias dc="cd" # i don't need this
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'


# extraction
ex ()
{
    if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2)   tar xjf $1   ;;
        *.tar.gz)    tar xzf $1   ;;
        *.bz2)       bunzip2 $1   ;;
        *.rar)       unrar x $1   ;;
        *.gz)        gunzip $1    ;;
        *.tar)       tar xf $1    ;;
        *.tbz2)      tar xjf $1   ;;
        *.tgz)       tar xzf $1   ;;
        *.zip)       unzip $1     ;;
        *.Z)         uncompress $1;;
        *.7z)        7z x $1      ;;
        *.deb)       ar x $1      ;;
        *.tar.xz)    tar xf $1    ;;
        *.tar.zst)   unzstd $1    ;;
        *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
