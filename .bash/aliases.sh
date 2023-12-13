#!/bin/bash

alias ls='ls -F --color=always'
alias grep='grep --colour=always'
alias less='less -RF'
alias du='du -had1'
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

## ls
alias la='ls -A'
alias ll='ls -al'

## grep
alias egrep='grep -E'
alias fgrep='fgrep -F'

## python
command -v python >/dev/null &&
  alias py='python' pym='python -m' pip='pym pip'

## pacman
command -v pacman >/dev/null &&
  alias pcs='pacman -S' pcu='pacman -Syu'
command -v pacman >/dev/null &&
  alias pcq='pacman -Q' pcr='pacman -R'

## yay
command -v yay >/dev/null &&
  alias ys='yay -S' yu='yay -Syu' yq='yay -Q' yr='yay -R'

## openvpn3
command -v openvpn >/dev/null &&
  alias vpnc='openvpn3 session-start --persist-tun --dco true -c'
command -v openvpn >/dev/null &&
  alias vpnd='openvpn3 session-manage -D -c'
command -v openvpn >/dev/null &&
  alias vpnr='openvpn3 session-manage --restart -c'
command -v openvpn >/dev/null &&
  alias vpnl='openvpn3 sessions-list'

## git
command -v git >/dev/null &&
  alias glog='git log --oneline --graph'
command -v git >/dev/null &&
  alias ga='git add' gcm='git commit' gco='git checkout'
command -v git >/dev/null &&
  alias gs='git status -sb' gsh='git stash' gus='git stash pop'

## bat
command -v bat >/dev/null &&
  alias cat='bat' bathelp='bat -pl help'

## neovim
command -v nvim >/dev/null && alias nv="nvim"
command -v vim >/dev/null && alias v="vim"
