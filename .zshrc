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
export ZSH="/home/stso/.oh-my-zsh"
export JAVA_HOME="/usr/lib/jdk-8u201-linux-x64/jdk1.8.0_201"
export ANDROID_SDK_ROOT="/home/stso/.sdks/android"

# update PATH
export PATH=/usr/lib/jdk-8u201-linux-x64/jdk1.8.0_201/bin:$PATH
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
export PATH=/usr/local/sdks/flutter_linux_v1.12.13+hotfix.7-stable/flutter/bin:$PATH
export PATH=/opt/android-studio-ide-191.6010548-linux/android-studio/bin:$PATH
export PATH=/home/stso/code/rpi-tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin:$PATH

# setup node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

##############################################
############# OH MY ZSH SETTINGS #############
##############################################

# oh my zsh theme
ZSH_THEME="classyTouch"

# Automatically check for updates every 13 days
export UPDATE_ZSH_DAYS=13

# Load Plugins
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

##############################################
################## ALIASES ###################
##############################################

# directory shortcuts
alias graz="~/code/FK_VISP_GRAZ_SERVER/software/"
alias orga="~/code/FK_ORGA/software/src"
alias storyt="cd /home/stso/code/pnp_drinking/tools/storyeditor"
alias master="cd /home/stso/OTH/masterarbeit/arbeit"

# environment presets
alias fkenv_test="export NODE_ENV=default_DEV;export VISP_USER=TEST_STSO;export TEST="1""
alias fkenv="export NODE_ENV=default_DEV;export VISP_USER=STSO"

# program shortcuts
alias ssh_local="ssh flower@192.168.178.24 -p 40000"

# export TERM="xterm"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

##############################################
############### SHELL SETTINGS ###############
##############################################

# make capslock an additional escape key
setxkbmap -option caps:escape

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


source /home/stso/.config/broot/launcher/bash/br
