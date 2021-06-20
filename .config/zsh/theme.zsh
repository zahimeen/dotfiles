###  CUSTOM PROMPT  ###

autoload -U colors && colors
setopt prompt_subst

##  PROMPT  ##

if [[ "$USER" == "root" ]]; then
  PROMPT="%(?:%{$fg_bold[red]%}%{$fg_bold[yellow]%}%{$fg_bold[red]%} :%{$fg_bold[red]%} )"
  PROMPT+='%{$fg[cyan]%}  %c%{$reset_color%} '
else
  PROMPT="%(?:%{$fg_bold[red]%}%{$fg_bold[green]%}%{$fg_bold[yellow]%} :%{$fg_bold[red]%} )"
  PROMPT+='%{$fg[cyan]%}  %c%{$reset_color%} '
  # RPROMPT='$(git_prompt_info)'
fi

##  GIT  ##

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}%{$fg[cyan]%} "
ZSH_THEME_GIT_PROMPT_SUFFI="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%} %{$fg[green]%}✗%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}) "

###  STARSHIP PROMPT  ###

# the two look exactly the same, however the starship prompt
# has way more features that provide a lot of help,
# or just add that nice bling to the terminal.
# if you are using this prompt, comment out the "RPROMPT"
# line in the "PROMPT" section above the "GIT" heading

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
eval "$(starship init zsh)"
