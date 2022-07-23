# fish path
set -e fish_user_paths

# vim = good, right?
set -gx EDITOR nvim
set -gx VISUAL nvim

# cannot ask for GPG password without it
set -gx GPG_TTY $(tty)

# the default config location is $HOME/.config/starship.toml
set -gx STARSHIP_CONFIG $HOME/.config/starship/config.toml

# pfetch stuff idk (arch linux big good yes)
set -gx PF_INFO "ascii title os host wm pkgs shell editor"
set -gx PF_ASCII "arch"
