#/bin/zsh

function load_plugin() {
    PLUGIN_NAME=$(echo $1)
    if [ -d "/usr/share/zsh/plugins/$PLUGIN_NAME" ]; then
        source "/usr/share/zsh/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        echo "Please install the ZSH plugin: $PLUGIN_NAME"
    fi
}

# Load Plugins
load_plugin "zsh-vi-mode"
load_plugin "zsh-autosuggestions"
load_plugin "zsh-syntax-highlighting"
load_plugin "zsh-history-substring-search"
