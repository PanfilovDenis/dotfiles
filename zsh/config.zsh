HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt no_share_history
unsetopt share_history
unsetopt sharehistory

bindkey '^[[5D' beginning-of-line
bindkey '[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '[C' end-of-line
