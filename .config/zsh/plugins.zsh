fpath=($HOME/.config/zsh/plugins/zsh-completions/src $fpath)

source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source $HOME/.config/zsh/plugins/dirhistory.plugin.zsh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
