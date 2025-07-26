# .bash_profile
# @author deng
# since 2024 2025

# loading .bashrc
[[ -s "$HOME/.config/bash/.bashrc" ]] && . "$HOME/.config/bash/.bashrc"

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# bash_completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.bash 2>/dev/null || :
