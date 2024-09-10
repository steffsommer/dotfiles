# source machine specific addons
for filename in ~/.config/custom_bash_scripts/*; do
  source $filename
done

export PATH="$PATH:/home/$USER/projects/scripts"

##############################################
############# OH MY BASH SETTINGS ############
##############################################

# Enable the subsequent settings only in interactive sessions
case $- in
*i*) ;;
*) return ;;
esac

# oh my bash stuff
export OSH='/home/steff/.oh-my-bash'
OSH_THEME="agnoster"
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
  bashmarks
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

# ls/lsd
if command -v lsd &>/dev/null; then
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
alias gdc='git diff --cached'

# other
alias pgcli='pgcli -U postgres -d'

##############################################
#################### MISC ####################
##############################################

# colored man pages
export LESS_TERMCAP_mb=$'\e[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\e[01;37m' # begin bold
export LESS_TERMCAP_me=$'\e[0m'     # end all mode like so, us, mb, md, mr
export LESS_TERMCAP_se=$'\e[0m'     # end standout-mode
export LESS_TERMCAP_so=$'\e[45;93m' # start standout mode
export LESS_TERMCAP_ue=$'\e[0m'     # end underline
export LESS_TERMCAP_us=$'\e[4;93m'  # start underlining

if [ -f /usr/share/nvm/init-nvm.sh ]; then
  source "/usr/share/nvm/init-nvm.sh"
fi

# set up zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init bash)"
fi
