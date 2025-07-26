#!/usr/bin/env bash

# .bash_aliases
# @author deng
# since 2024 2025

if [[ -x $(command -v eza) ]]; then
  alias l.='eza --icons=auto -a'
  alias ls='eza --icons=auto'
  alias ll='eza --icons=auto --long -a --sort=type'
else
  alias ls='ls -F --color=auto'
  alias ll='ls -alhF'
fi

alias ~='cd ~'
alias ..='cd ..'
alias c='clear'

alias ff='fastfetch'
alias vi='nvim'
alias gst='git status'
alias cfg='cd ~/.config'
alias 哈吉米='cat'
