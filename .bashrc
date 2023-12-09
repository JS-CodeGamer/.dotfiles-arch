#
# ~/.bashrc
#

# check if shell is interactive
[[ $- != *i* ]] && return

# variables that set up the environment for init scrtips
INIT_SCRIPTS_PATH=~/.bash/init
use_color=true
bashrc_running=true

for script in $INIT_SCRIPTS_PATH/*.sh; do
	[[ -f $script ]] && source $script
done

xhost +local:root >/dev/null 2>&1

# fzf -- fuzy search
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# nvm -- node version manager
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# bash completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

unset use_color
unset INIT_SCRIPTS_PATH
unset bashrc_running

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# local bin
PATH=$PATH:$HOME/.local/bin
