# fish path
set -e fish_user_paths
fish_add_path $HOME/.cargo/bin

# neovim better
set -gx EDITOR nvim
set -gx VISUAL nvim

# cannot ask for GPG password without it
set -gx GPG_TTY $(tty)

# the default config location is $HOME/.config/starship.toml
set -gx STARSHIP_CONFIG $HOME/.config/starship/config.toml
