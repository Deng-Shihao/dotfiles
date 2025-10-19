# .zshrc
# @author deng
# since 2024 2025

# Start the profiler at the top of the .zshrc
# zmodload zsh/zprof

# Check for interactive shell. If not, don't load anything.
case $- in
  *i*) ;;
  *) return;;
esac

# Zinit is now loaded immediately, as it's the core of our plugin management.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname "$ZINIT_HOME")"
[ ! -d "$ZINIT_HOME/.git" ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Zinit Plugin
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
    Aloxaf/fzf-tab

# zinit light Aloxaf/fzf-tab

# Starship shell prompt.
zinit ice as"command" from"gh-r" \
         atclone="./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
         atpull="%atclone" src="init.zsh"
zinit light starship/starship

# Completion & Path
autoload -Uz compinit
compinit -C # Load completions

zinit cdreplay -q

# Path
export EDITOR=nvim
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^A' vi-beginning-of-line
bindkey '^E' vi-end-of-line
bindkey '^[w' kill-region

HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.zsh_history
setopt append_history share_history hist_ignore_space hist_save_no_dups hist_ignore_dups hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
[ -f "$HOME/.config/zsh/.zsh_aliases" ] && . "$HOME/.config/zsh/.zsh_aliases"

# Shell integrations
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_DEFAULT_OPTS='--height 40% --layout reverse'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# zprof

# Java
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
