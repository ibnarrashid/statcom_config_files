# ~/.zshrc

source ~/.cmds

bindkey -v

autoload -U compinit colors
compinit
colors

PROMPT="
( %~ ) : "
RPROMPT="( %{$fg[green]%}%*%{$reset_color%} )"

export HISTFILE=~/.zsh_history
export HISTSIZE=5000
export SAVEHIST=5000

zstyle ':completion:*' menu select

setopt completealiases

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# EOF.
