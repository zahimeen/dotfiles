#/bin/zsh

function add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then 
        [ -f "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" ] && source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
        [ -f "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh" ] && source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
        [ -f "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.sh" ] && source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.sh"
        return
    fi
    git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
}
