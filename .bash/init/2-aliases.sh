#!/bin/bash

parse_args__aliases() {
  while [ "$#" -gt 0 ]; do
    case "$1" in
    -c | --colorful)
      use_color=true
      ;;
    -h | --help)
      printf "Usage: . aliases.sh [-c|--colorful [true|false]]\n"
      ;;
    -*)
      printf "\033\e[31mWARN: \033\e[00m No option %s found. Skipping.\n" "$1"
      printf "Usage: . aliases.sh [-c|--colorful]\n" 1>&2
      ;;
    *) ;;
    esac
    shift
  done
}

# Parse Arguments if not running in bashrc
[ "$bashrc_running" != true ] && parse_args__aliases "$@"

## Aliases with colors
if [ $use_color == true ]; then
  alias ls='ls -F --color=always'
  alias grep='grep --colour=always'
  alias less='less -RF'
else
  alias ls='ls -F'
fi

## from manjaro bashrc
alias du='du -had1'
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB
alias more=less less

## ls
alias la='ls -A'
alias ll='ls -al'

## grep
alias egrep='grep -E'
alias fgrep='fgrep -F'

## python
alias py='python' python
alias pym='python -m' python
alias pip='pym pip' python

## pacman
alias pcs='pacman -S' pacman
alias pcu='pacman -Syu' pacman
alias pcq='pacman -Q' pacman
alias pcr='pacman -R' pacman

## yay
alias ys='yay -S' yay
alias yu='yay -Syu' yay
alias yq='yay -Q' yay
alias yr='yay -R' yay

## openvpn3
alias vpnc='openvpn3 session-start --persist-tun --dco true -c' openvpn
alias vpnd='openvpn3 session-manage -D -c' openvpn
alias vpnr='openvpn3 session-manage --restart -c' openvpn
alias vpnl='openvpn3 sessions-list' openvpn

## git
alias glog='git log --oneline --graph' git
alias gcm='git commit' git
alias gco='git checkout' git
alias gs='git status -sb' git
alias gsh='git stash' git
alias gus='git stash pop' git
alias ga='git add' git

## bat
alias cat='bat' bat
alias bathelp='bat -pl help' bat

## neovim
alias nv="nvim" nvim
alias v="vim" vim
