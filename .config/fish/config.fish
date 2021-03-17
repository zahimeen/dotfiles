### EXPORT ###
set fish_greeting
set TERM "xterm-256color"
set EDITOR "nvim"
set VISUAL "nvim"

### ALIAS ###
alias ls='exa -al --color=always --group-directories-first'
alias cat='bat'
alias grep='rg'

### STARSHIP PROMPT ###
starship init fish | source

### STARTUP ###
neofetch
