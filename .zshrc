#               __             
#   ____  _____/ /_  __________
#  /_  / / ___/ __ \/ ___/ ___/
#   / /_(__  ) / / / /  / /__  
#  /___/____/_/ /_/_/   \___/  
# author: somsky

##############################################
############ ENVIRONMENT SETTINGS ############
##############################################

# oh-my-zsh installation directory
export ZSH="/home/somsky/.oh-my-zsh"

# setup node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:/opt/flutter-1.17.1/bin"

##############################################
############# OH MY ZSH SETTINGS #############
##############################################

ZSH_THEME="agnoster"
# ZSH_THEME="miloshadzic"


# Automatically check for updates every 13 days
export UPDATE_ZSH_DAYS=13

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

# directory shortcuts
alias graz="~/code/FK_VISP_GRAZ_SERVER/software/"
alias orga="~/code/FK_ORGA/software/src"
alias mcode="cd ~/code/autonomousdrone/code/simulation"
alias marbeit="cd ~/code/autonomousdrone/arbeit"

alias v="vim"
alias vimrc='"$EDITOR" ~/.config/nvim/init.vim'
alias zshrc='"$EDITOR" ~/.zshrc'
alias i3conf='"$EDITOR" ~/.config/i3/config'

# program shortcuts
alias ssh_local="ssh flower@192.168.178.24 -p 40000"
alias mensa="~/code/mensa/menu.py stwnodatasource"
alias visp="~/code/fk_visp_3/VISP/Backend"

# export TERM="xterm"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

# Checkout git branch using fzf
chbr() {
    git checkout $(grep -o -e '[a-zA-Z0-9_]*' <<< $(git --no-pager branch) | fzf)
}

c() {
  cd "$@" && ls
}

ku() {
  kill -9 $(ps aux | grep Unity | head -n 1)  
}

source /usr/share/nvm/init-nvm.sh

# colored man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
