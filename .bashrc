##############################################
############## MINI PLUGIN SYSTEM ############
##############################################

shopt -s nullglob
for filename in ~/.config/custom_bash_scripts/*; do
  source $filename
done
shopt -u nullglob

##############################################
############# OH MY BASH SETTINGS ############
##############################################

# Enable the subsequent settings only in interactive sessions
case $- in
*i*) ;;
*) return ;;
esac

export OSH="/home/$USER/.oh-my-bash"
OSH_THEME="font"
OMB_USE_SUDO=false
completions=(
  git
  composer
  ssh
)
aliases=(
  general
)
plugins=(
  git
)
source "$OSH"/oh-my-bash.sh

##############################################
############### SHELL SETTINGS ###############
##############################################

# enable vi mode
set -o vi

bind "\C-p":previous-history
bind "\C-n":next-history
bind "\C-l":clear-screen

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
alias zshrc='"$EDITOR" ~/.zshrc'
alias i3conf='"$EDITOR" ~/.config/i3/config'
alias ed="nvim ~/projects/dotfiles"

alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# git
alias gs='git status -u'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdb='git diff development --color-moved=dimmed-zebra --color-moved-ws=ignore-all-space --find-renames'
alias gcm='git commit -m'
alias gcma='git commit --amend'
alias gl="git log --graph --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
alias gaa='git add "*"'
alias gfa='git fetch --all'
alias gp='git pull'
alias pushnoci='git push -o integrations.skip_ci'

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

if [ -f /usr/share/fzf/key-bindings.bash ]; then
  source /usr/share/fzf/key-bindings.bash
fi

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

function urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }

export PATH=$PATH:/home/$USER/go/bin
