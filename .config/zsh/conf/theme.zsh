# allows colors in zsh prompt
autoload -U colors && colors
setopt prompt_subst

# starship prompt
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
eval "$(starship init zsh)"

# autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#575757"
