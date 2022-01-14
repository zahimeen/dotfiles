#/bin/zsh

function add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZSH_CUSTOM/plugins/$PLUGIN_NAME" ]; then 
        return
    fi
    git clone "https://github.com/$1.git" "$ZSH_CUSTOM/plugins/$PLUGIN_NAME"
}

add_plugin "zsh-users/zsh-autosuggestions"
add_plugin "zsh-users/zsh-syntax-highlighting"
