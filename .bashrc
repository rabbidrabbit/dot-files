#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1=$'[\u@\h]-[\W]$(__git_ps1 "-[\e[0;31m%s\e[0m]")\$ '
PS1=$'[\u@\h]-[\W]$(__git_ps1 "-[%s]")\$ '
alias cd..='cd ..'
alias grep='grep --color'
alias diff="colordiff"
export EDITOR='vim'
export BROWSER='/usr/bin/chromium'
