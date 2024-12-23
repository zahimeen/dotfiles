if not status is-interactive
	return
end

if test -e ~/.profile
	fenv source ~/.profile
end

set fish_greeting
set fish_escape_delay_ms 10

alias cp "cp -i"
alias mv "mv -i"
alias rm "rm -i"
alias ls "eza -a --color=always --sort=type"

alias matr "unimatrix -s 96 -c magenta" # it too slow

alias nivm "nvim"
alias vnim "nvim"
alias hx "helix"

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx GPG_TTY (tty)

fish_config theme choose "Rosé Pine"

# better cd thing idk
zoxide init fish | source

# vi mode
fish_vi_key_bindings
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace underscore

# prompt
set -gx STARSHIP_CONFIG $HOME/.config/starship/config.toml
starship init fish | source
