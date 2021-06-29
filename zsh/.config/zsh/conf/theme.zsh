# allows colors in zsh prompt
autoload -U colors && colors
setopt prompt_subst

package=starship

if pacman -Qs $package > /dev/null ; then

    export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
    eval "$(starship init zsh)"
    RPROMPT='$(git_prompt_info)'

else

    PROMPT="%(?:%{$fg_bold[red]%}%{$fg_bold[green]%}%{$fg_bold[yellow]%} :%{$fg_bold[red]%} )"
    PROMPT+='%{$fg[cyan]%}  %c%{$reset_color%} '
    RPROMPT='$(git_prompt_info)'

fi

###  GIT RPROMPT  ###

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} ✗%{$reset_color%} "

