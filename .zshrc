# Initialize colors.
autoload -U colors; colors
autoload -U compinit; compinit

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history
 
# Allow for functions in the prompt.
setopt PROMPT_SUBST
setopt automenu
setopt correct
setopt histignorealldups
 
# Autoload zsh functions.
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)
 
# Enable auto-execution of functions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
 
# Append git functions needed for prompt.
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'
 
# Set the prompt.
PROMPT=$'┌──[%{$fg[cyan]%}%n@%m%{$reset_color%}]-[%{${fg[magenta]}%}%B%~%b]$(prompt_git_info)%{${fg[default]}%}\n└─\$ '

alias ls='ls --color'
alias cd..='cd ..'
alias grep='grep --color'
alias diff='colordiff'

bindkey -v

export EDITOR='vim'
export BROWSER='/usr/bin/chromium'
export GOPATH='/home/jonathan/go'
export PATH=$PATH:/home/jonathan/.gem/runy/1.9.1/bin
