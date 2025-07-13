# @Author Deng
eval "$(starship init zsh)" # Starship

# Activate Plugins
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -Uz compinit && compinit # Load completions
source ~/somewhere/fzf-tab.plugin.zsh # fzf-tab completion

# Default Editor
export EDITOR=nvim

# History
HISTSIZE=5000
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

# Aliases
alias vi='nvim'
alias bk='cd ..'
alias c='clear'
alias ls='eza -al --icons'
alias ll='ls -alF'
alias ff='fastfetch'
alias gst='git status'
alias config='cd ~/.config'

# Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# Shell Integrations
eval "$(fzf --zsh)" # Fzf
