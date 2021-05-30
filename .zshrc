export ZSH="/home/zahin/.oh-my-zsh"

plugins=(git archlinux zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export TERM="xterm-256color"
export EDITOR="devour emacsclient -c -a 'emacs'"
export VISUAL="nvim"

alias l='exa -al --color=always --group-directories-first'
alias ls='exa -al --color=always --group-directories-first'
alias grep='rg'
alias cat='bat'
alias rm="rm -i"

alias em="devour emacsclient -c -a 'emacs'"
alias emdebug="/usr/bin/emacs --debug-init"
alias emrestart="/usr/bin/emacs --daemon"

alias rls="clear ; ls"

# eval "$(starship init zsh)"

# prompt
if [[ "$USER" == "root" ]]; then
  PROMPT="%(?:%{$fg_bold[red]%}%{$fg_bold[yellow]%}%{$fg_bold[red]%} :%{$fg_bold[red]%} )"
  PROMPT+='%{$fg[cyan]%}  %c%{$reset_color%} $(git_prompt_info)'
else
  PROMPT="%(?:%{$fg_bold[red]%}%{$fg_bold[green]%}%{$fg_bold[yellow]%} :%{$fg_bold[red]%} )"
  PROMPT+='%{$fg[cyan]%}  %c%{$reset_color%} $(git_prompt_info)'
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}  git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

precmd() { print "" }
