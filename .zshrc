#               __
#   ____  _____/ /_  __________
#  /_  / / ___/ __ \/ ___/ ___/
#   / /_(__  ) / / / /  / /__
#  /___/____/_/ /_/_/   \___/
#
# author: steffsommer


##############################################
############## MINI PLUGIN SYSTEM ############
##############################################

setopt NULL_GLOB
for filename in ~/.config/custom_bash_scripts/*; do
  source $filename
done

##############################################
############## OH MY ZSH SETTINGS ############
##############################################

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
export UPDATE_ZSH_DAYS=14

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

##############################################
################ ZSH SETTINGS ################
##############################################

# Immediately show suggestions without asking
LISTPROMPT=""

# enable vi mode
bindkey -v

# fix backspace for vi mode
bindkey "^?" backward-delete-char

# get rid of delay time when swiching between modes
export KEYTIMEOUT=1

# Navigate history using <C-P> and <C-N>
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history

##############################################
############ ENVIRONMENT SETTINGS ############
##############################################

export EDITOR="nvim"

##############################################
################## ALIASES ###################
##############################################

# quick configs
alias v="nvim"
alias vim="nvim"
alias i3conf='"$EDITOR" ~/.config/i3/config'

alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# git
alias gs='git status -u'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdb='git diff --color-moved=dimmed-zebra --color-moved-ws=ignore-all-space --find-renames'
alias gcm='git commit -m'
alias gl="git log --graph --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
alias gaa='git add "*"'
alias gfa='git fetch --all'
alias gp='git pull'

# postgres stuff
alias pgl='python -m pgcli -U postgres -d' # followed by db_name
alias listdbs='python -m pgcli -U postgres -l'

##############################################
########## PROGRESSIVE ENHANCEMENT ###########
##############################################

if command -v lsd &>/dev/null; then
  alias ls='lsd'
fi

if [ -f /usr/share/nvm/init-nvm.sh ]; then
  source "/usr/share/nvm/init-nvm.sh"
fi

# load fzf integration
source <(fzf --zsh)


##############################################
############## CUSTOM FUNCTIONS ##############
##############################################

# Forcefully kill a process based a port it occupies
# Usage: portpkill <port>
function portpkill() {
  ss_line=$(ss -lptn "sport = $1")
  pid=$(echo $ss_line | awk -F'pid=' '{print $2}' | awk -F',' '{print $1}')
  kill -9 $pid
}

# Git Push Upstream
# - Create a upstream branch for the currently checked out branch at the origin remote
# - Push the local changes to the upstream branch
function gpu {
	branch_name=$(git rev-parse --abbrev-ref HEAD)
	if [ $? -ne 0 ]; then
		echo 'Failed to retrieve branch name. Potentially the command was executed outside a git repository'
		exit -1
	fi
	git push --set-upstream origin "$branch_name"
}

##############################################
#################### MISC ####################
##############################################

# Colored man pages
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1

export PATH="$PATH:/home/$USER/projects/scripts"
