# machine specific configurations
shopt -s nullglob
for filename in ~/.config/custom_bash_scripts/*; do
  source $filename
done
shopt -u nullglob

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
osh_dir="/home/$USER/.oh-my-bash"
if [ -d "$DIRECTORY" ]; then
  export OSH=$osh_dir
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
fi

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

# ls/lsd
if command -v lsd &>/dev/null; then
  alias ls='lsd'
fi
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
alias gl="git log --graph --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
alias gaa='git add "*"'
alias gfa='git fetch --all'
alias gp='git pull'
alias pushnoci='git push -o integrations.skip_ci'

# - Create a upstream branch for the currently checked out branch at the origin remote
# - Push the local changes to the upstream branch
# git push upstream
function gpu {
	branch_name=$(git rev-parse --abbrev-ref HEAD)
	if [ $? -ne 0 ]; then
		echo 'Failed to retrieve branch name. Potentially the command was executed outside a git repository'
		exit -1
	fi
	git push --set-upstream origin "$branch_name"
}


# postgres stuff
alias pgl='python -m pgcli -U postgres -d' # followed by db_name
alias listdbs='python -m pgcli -U postgres -l'

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
# required for the colors to work in some terminals, e.g. Windows Terminal
export GROFF_NO_SGR=1


if [ -f /usr/share/nvm/init-nvm.sh ]; then
  source "/usr/share/nvm/init-nvm.sh"
fi

# set up zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init bash)"
fi
