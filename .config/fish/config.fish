if not status is-interactive
	return
end

if test -e ~/.profile
	fenv source ~/.profile
end

set fish_greeting

alias cp "cp -i"
alias mv "mv -i"
alias rm "rm -i"
alias ls "eza -a --color=always --sort=type"

alias matr "unimatrix -s 96 -c magenta" # it too slow

alias nivm "nvim"
alias vnim "nvim"

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx GPG_TTY (tty)

fish_config theme choose "Rosé Pine"

# better cd thing idk
zoxide init fish | source

# prompt
set -gx STARSHIP_CONFIG $HOME/.config/starship/config.toml
starship init fish | source
