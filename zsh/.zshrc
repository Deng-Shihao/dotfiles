# @author Sh Deng

# Starship
eval "$(starship init zsh)" 

# Activate Plugins
# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz compinit && compinit -C # Load completions
source ~/somewhere/fzf-tab.plugin.zsh # fzf-tab completion

# Default Editor
export EDITOR=nvim

# History
HISTSIZE=2000
HISTFILE=$HOME/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt append_history
setopt share_history
setopt hist_ignore_space 
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^A' vi-beginning-of-line
bindkey '^E' vi-end-of-line

# Aliases
alias ~='cd ~'
alias ..='cd ..'
alias c='clear'
alias ls='ls -ahF --color'
alias ll='ls -alhF --color'
alias ff='fastfetch'
alias vi='nvim'
alias gst='git status'
alias cfg='cd ~/.config'
alias 哈吉米='cat'

# Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# Vim
set -o vi

# Set up fzf key bindings and fuzzy completion
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_DEFAULT_OPTS='--layout reverse'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_DEFAULT_OPTS='--height 40% --layout reverse --border'
source <(fzf --zsh) fzf
