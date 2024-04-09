export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# set PATH so it includes user's private bin if it exists
[[ -d "$HOME/.cargo/bin" ]] && export PATH="$HOME/.cargo/bin:$PATH"
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

# if running bash and there is ~/.bashrc
[[ -n "$BASH_VERSION" ]] && [[ -f ~/.bashrc ]] && source ~/.bashrc
