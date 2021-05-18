#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll="ls --color -lh"
alias la="ls --color -lha"
alias grep='grep --color=auto'
alias spm="sudo pacman"
alias vim="nvim"
alias _="sudo"

# export PS1="\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]@\[$(tput sgr0)\]\[\033[38;5;7m\]\h\[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]\n>\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

source ${HOME}/.scripts/*.sh

export EDITOR=vim
# Unlimited hist file
export HISTSIZE=-1
export HISTFILESIZE=-1

if [ -v WAYLAND_DISPLAY ] ; then 
    export QT_QPA_PLATFORM=wayland-egl  
    export _JAVA_AWT_WM_NONREPARENTING=1 
    export MOZ_ENABLE_WAYLAND=1
    # Screen share! 
    export XDG_CURRENT_DESKTOP=sway
    export XDG_SESSION_TYPE=wayland


    if [ -n "$(command -v xrdb)" ]; then 
        xrdb ~/.Xresources 
    fi
fi

## enable color support of ls and also add handy aliases
#if [ "$TERM" != "dumb" ]; then
#    [ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
#    [ -e "$DIR_COLORS" ] || DIR_COLORS=""
#    eval "`dircolors -b $DIR_COLORS`"
#    alias ls='ls --color=auto'
#    #alias dir='ls --color=auto --format=vertical'
#    #alias vdir='ls --color=auto --format=long'
#fi

#PATH="/home/seva/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/home/seva/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/seva/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/seva/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/seva/perl5"; export PERL_MM_OPT;
