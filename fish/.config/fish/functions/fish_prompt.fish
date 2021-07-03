# starship

set fish_color_normal white
set fish_color_autosuggestion '#666'
set fish_color_command brgreen
set fish_color_error red --bold
set fish_color_param white

set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
starship init fish | source

# vim: filetype=fish
