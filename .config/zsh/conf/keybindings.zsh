#!/bin/zsh

bindkey -e

bindkey '^[[7~' beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[[8~' end-of-line
bindkey '^[[F' end-of-line

bindkey '^[[2~' overwrite-mode
bindkey '^[[3~' delete-char
bindkey '^[[C'  forward-char
bindkey '^[[D'  backward-char

bindkey '^[Oc' forward-word
bindkey '^[Od' backward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word
bindkey '^[[Z' undo

# Prevents Vi Mode Plugin from Overidding These Keybindings
function zvm_before_init() {
    zvm_bindkey viins '^[[A' history-substring-search-up
    zvm_bindkey viins '^[[B' history-substring-search-down
    zvm_bindkey vicmd '^[[A' history-substring-search-up
    zvm_bindkey vicmd '^[[B' history-substring-search-down
}
