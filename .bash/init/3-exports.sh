#!/bin/bash

## Global defaults
if command -v bat >/dev/null 2>&1; 
then
  export PAGER="bat"
fi
if command -v nvim >/dev/null 2>&1; then
  export EDITOR="nvim"
fi

## nvm -- node version manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

## git
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

## bat -- cat replacement
export BAT_CONFIG_PATH=~/.config/bat/bat.conf
# export BAT_THEME="..."
# export BAT_STYLE="..."
# export BAT_PAGER="..."
## currently defined in bat config

## man
export MANROFFOPT="-c"
if command -v bat >/dev/null 2>&1;
then
  export MANPAGER="sh -c 'col -bx | bat -plman'"
fi

## fzf
if command -v fzf >/dev/null 2>&1;
then
  if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files'
    export FZF_DEFAULT_OPTS='-m'
  else
    export FZF_DEFAULT_COMMAND="find . -regextype 'posix-extended' -iregex '.*(\.git|cache|node_modules).*' -type d -prune -o -type f -print -o -type l -print"
  fi
fi
