#/bin/zsh

function load_plugin() {
    PLUGIN_NAME=$(echo $1)
    PLUGIN_FILE=$(if [ -z $2 ]; then echo $1; else echo $2; fi)
    if [ -d "/usr/share/zsh/plugins/$PLUGIN_NAME" ]; then
        source "/usr/share/zsh/plugins/$PLUGIN_NAME/$PLUGIN_FILE.zsh"
    else
        echo "Please install the ZSH plugin: $PLUGIN_NAME"
    fi
}

# Load Plugins
load_plugin "zsh-vi-mode"
load_plugin "zsh-autosuggestions"
load_plugin "zsh-syntax-highlighting"
load_plugin "zsh-history-substring-search"
load_plugin "zsh-autopair" "autopair"
