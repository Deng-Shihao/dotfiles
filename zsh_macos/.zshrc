 # @Author Deng

# Activate Plugins
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf-tab completion
source ~/somewhere/fzf-tab.plugin.zsh
eval "$(starship init zsh)"

# Default Editor
export EDITOR=nvim

# Proxy
# export https_proxy=http://127.0.0.1:7897 http_proxy=http://127.0.0.1:7897 all_proxy=socks5://127.0.0.1:7897

# Brew
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
# export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
# export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"

# Load completions
autoload -U compinit; compinit

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
alias h='cd ..'
alias ls='ls -F --color=auto'
alias ll='ls -lF --color=auto'
alias ll='eza -l --icons'
alias ls='eza --icons'
alias ff='fastfetch'
alias gst='git status'
alias config='cd ~/.config'

# Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' menu no
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Shell integrations
eval "$(fzf --zsh)"

# Activete completion
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
  fi

# Python
eval "$(pyenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

#Anaconda
export PATH=$PATH:/opt/anaconda3/bin

# >>> conda initialize >>>
# !! Conte
# nts within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
    
