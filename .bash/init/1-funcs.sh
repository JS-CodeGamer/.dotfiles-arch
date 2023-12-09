#!/bin/bash

## colors - color lister
## usage: colors
colors() (
  printf "Color escapes are %s\n" '\e[${value};...;${value}m'
  printf "Values 30..37 are \e[0#33mforeground colors\e[m\n"
  printf "Values 40..47 are \e[43mbackground colors\e[m\n"
  printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

  # foreground colors
  for fgc in {30..37}; do
    # background colors
    for bgc in {40..47}; do
      fgc=${fgc#37} # white
      bgc=${bgc#40} # black

      vals="${fgc:+$fgc;}${bgc}"
      vals=${vals%%;}

      seq0="${vals:+\e[${vals}m}"
      printf "  %-9s" "${seq0:-(default)}"
      printf " ${seq0}TEXT\e[m"
      printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
    done
    printf "\n\n"
  done
)

## ex - archive extractor
## usage: ex <file>
ex() {
  if [ $# -eq 0 ]; then
    echo "error: no <file> provided for extraction"
    echo "usage: ex <file>"
  fi
  while [ $# -ne 0 ]; do
    if [ ! -f $1 ]; then
      echo "'$1' is not a valid file"
    fi
    case $1 in
    *.tar.bz2) tar xjf $1 ;;
    *.tar.gz) tar xzf $1 ;;
    *.tbz2) tar xjf $1 ;;
    *.tgz) tar xzf $1 ;;
    *.tar) tar xf $1 ;;
    *.bz2) bunzip2 $1 ;;
    *.rar) unrar x $1 ;;
    *.gz) gunzip $1 ;;
    *.zip) unzip $1 ;;
    *.Z) uncompress $1 ;;
    *.7z) 7z x $1 ;;
    *) echo "'$1' cannot be extracted via ex()" ;;
    esac
    shift
  done
}

## help - get help for a command
## usage: help <command>
help() {
  "$@" --help 2>&1 | bathelp
}

## createAlias - create alias for a command if
##    dependencies exist
## usage: createAlias <command> [<dep1> ...]
alias() {
  if [ $# -eq 0 ]; then
    echo "usage: createAlias <command> [<dep1 ...>]"
  fi
  local aliasCommand=$1
  shift
  for dep in $@; do
    if ! command -v $1 2>&1 >/dev/null; then
      return 1
    fi
  done
  command alias "$aliasCommand"
}
