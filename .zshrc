#               __
#   ____  _____/ /_  __________
#  /_  / / ___/ __ \/ ___/ ___/
#   / /_(__  ) / / / /  / /__
#  /___/____/_/ /_/_/   \___/
# author: steff

##############################################
############ ENVIRONMENT SETTINGS ############
##############################################

export EDITOR="nvim"

##############################################
############# OH MY ZSH SETTINGS #############
##############################################

# oh-my-zsh installation directory
export ZSH="/home/$USER/.oh-my-zsh"

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

# quick configs
alias v="nvim"
alias vim="nvim"
alias zshrc='"$EDITOR" ~/.zshrc'
alias i3conf='"$EDITOR" ~/.config/i3/config'

# ls/lsd
if command -v lsd &> /dev/null
then
  alias ls='lsd'
fi
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# git
alias gs='git status'
alias gaa='git add --all'
alias gfa='git fetch --all'
alias gl='git log'
alias gp='git pull'
alias gcm='git commit -m'

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
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;37m'       # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end all mode like so, us, mb, md, mr
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[45;93m'       # start standout mode
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[4;93m'        # start underlining
