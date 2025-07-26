# .zprofile
# @author deng
# Since 2024 2025

# loading .zshrc
[[ -s ~/.config/zsh_macos/.zshrc]] && source ~/.config/zsh_macos/.zshrc

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.bash 2>/dev/null || :
