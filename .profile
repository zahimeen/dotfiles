export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.cargo/bin" ] ; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		source "$HOME/.bashrc"
	fi
fi
