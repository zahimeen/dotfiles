unsetopt BEEP

setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef
zle_highlight=('paste:none')

autoload -U compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)	

autoload edit-command-line; zle -N edit-command-line
