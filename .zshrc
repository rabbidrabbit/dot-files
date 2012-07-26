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

PROMPT2="%{"$'\e[1A'"├"$'\e[1B\e[1D'"%}\
└─%_─>"

alias ls='ls --color'
alias cd..='cd ..'
alias grep='grep --color'
alias diff='colordiff'
alias tmux='tmux -2'

 GRC=`which grc`
    if [ "$TERM" != dumb ] && [ -n GRC ]
    then
        alias colourify="$GRC -es --colour=auto"
        #alias configure='colourify ./configure'
        #alias diff='colourify diff'
        #alias make='colourify make'
        #alias gcc='colourify gcc'
        #alias g++='colourify g++'
        #alias as='colourify as'
        #alias gas='colourify gas'
        #alias ld='colourify ld'
        #alias netstat='colourify netstat'
        #alias ping='colourify ping'
        #alias traceroute='colourify /usr/sbin/traceroute'
    fi

#bindkey -v

if [ "$TERM" = "linux" ]; then
    setfont /usr/share/kbd/consolefonts/ter-112n.psf.gz

    #echo -en "\e]P01C1C1C" # 0
    echo -en "\e]P02D2D2D" # 0
    echo -en "\e]P83D3A3A" # 8

    echo -en "\e]P1D74B73" # 1
    echo -en "\e]P9B94062" # 9

    echo -en "\e]P29ACC79" # 2
    echo -en "\e]PA8FB676" # 10

    echo -en "\e]P3D0D26B" # 3
    echo -en "\e]PBC8BC45" # 11

    echo -en "\e]P477B6C5" # 4
    echo -en "\e]PC8FA7B9" # 12

    echo -en "\e]P5A488D9" # 5
    echo -en "\e]PD8888A1" # 13

    echo -en "\e]P67FCAB3" # 6
    echo -en "\e]PE6EC2A8" # 14

    echo -en "\e]P7B5B5B5" # 7
    echo -en "\e]PFDAD3D3" # 15

    tmux new
fi

# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "^H" backward-delete-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

export EDITOR='vim'
export BROWSER='/usr/bin/google-chrome'
export GOPATH='/home/jonathan/go'
export PATH=$PATH:/home/jonathan/.gem/ruby/1.9.1/bin:/opt/clojurescript/bin/:/root/.gem/ruby/1.9.1/bin:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/home/jonathan/bin
export PKG_CONFIG_PATH=/usr/lib/pkgconfig
