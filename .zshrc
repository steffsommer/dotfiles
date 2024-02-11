#               __
#   ____  _____/ /_  __________
#  /_  / / ___/ __ \/ ___/ ___/
#   / /_(__  ) / / / /  / /__
#  /___/____/_/ /_/_/   \___/
# author: steff

##############################################
############ ENVIRONMENT SETTINGS ############
##############################################

# oh-my-zsh installation directory
export ZSH="/home/$USER/.oh-my-zsh"

# setup node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR="nvim"

##############################################
############# OH MY ZSH SETTINGS #############
##############################################

ZSH_THEME="robbyrussell"

# Automatically check for updates every 14 days
export UPDATE_ZSH_DAYS=14

# Load Plugins
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

##############################################
################## ALIASES ###################
##############################################

alias v="nvim"
alias vim="nvim"
alias vimrc='"$EDITOR" ~/.config/nvim/init.vim'
alias zshrc='"$EDITOR" ~/.zshrc'
alias i3conf='"$EDITOR" ~/.config/i3/config'

# swap ls for lsd (if available)
if command -v lsd &> /dev/null
then
  alias ls='lsd'
fi
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# directory aliases
alias sb="cd ~/code/steffs_blog"

##############################################
############### SHELL SETTINGS ###############
##############################################

# enable vi mode
bindkey -v

# fix backspace for vi mode
bindkey "^?" backward-delete-char

# get rid of delay time when swiching between modes
export KEYTIMEOUT=1

##############################################
############## CUSTOM FUNCTIONS ##############
##############################################

source /usr/share/nvm/init-nvm.sh

# colored man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
