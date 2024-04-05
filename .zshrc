# dont run anything if not interactive
case $- in
    *i*) ;;
      *) return;;
esac

# include .profile if it exists
if [ -f "$HOME/.profile" ]; then
	source "$HOME/.profile"
fi

# imagine actually using this
unsetopt BEEP

# allow the use of colors
autoload -U compinit colors zcalc
compinit -d
colors

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

# prompt
if hash starship 2>/dev/null; then
	export STARSHIP_CONFIG=$HOME/.config/starship/config.toml
	eval "$(starship init zsh)"
else
	PS1="%F{blue}%n${RESET} %F{cyan}%~ %f"
fi

# zsh highlighting is stupid
# vim: ft=sh
