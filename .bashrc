# this file needs to be sourced by
# "~/.bash_profile" or "~/.profile"

# dont run anything if not interactive
[[ $- != *i* ]] && return

# we don't want a bell
bind 'set bell-style none'

# out of the way
export HISTFILE=$XDG_STATE_HOME/bash/history

# editor stuff
if hash nvim 2> /dev/null; then
	export EDITOR="nvim"
	export VISUAL="nvim"
else
	export EDITOR="vim"
	export VISUAL="vim"
fi

# for gpg pass key thing
export GPG_TTY=$(tty)

# aliases
alias nivm="nvim"
alias vnim="nvim"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
if hash eza 2>/dev/null; then
	alias ls="eza -a --color=always --sort=type"
else
	alias ls="ls -a --color=always --sort=version"
fi

# zoxide
if hash zoxide 2>/dev/null; then
	eval "$(zoxide init bash)"
fi

# prompt
if hash starship 2>/dev/null; then
	export STARSHIP_CONFIG=$HOME/.config/starship/config.toml
	eval "$(starship init bash)"
else
	PS1='\e[0;34m\u\e[m \e[0;36m\W \e[m'
fi
