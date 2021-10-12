[[ $- != *i* ]] && return

export TERM="xterm-256color"
export EDITOR="vim"
export VISUAL="vim"

alias ls='ls -a --color=always --sort=version'
alias rls="clear ; ls"

alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

alias gs='git status'
alias gc='git commit -S'
alias gp='git push'
alias ga='git add'
alias gb='git checkout'

alias nimv="nvim"
alias nivm="nvim"
alias vnim="nivm"

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

bind 'set bell-style none'  # disables error bell
PS1='\e[0;32m\u\e[m: \e[0;34m\W \e[m'
