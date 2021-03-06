source /usr/share/zsh/share/antigen.zsh
source $HOME/.scripts/*.sh

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=10000

#------------------------------
# Alias stuff
#------------------------------
alias ls="ls --color=always -F"
alias ll="ls --color=always -lh"
alias spm="sudo pacman"
alias vr="vim --remote-silent"
alias v="vim"
alias _="sudo"
# alias ash="adb shell su system"
alias ash="adb shell su 0"

#------------------------------
# ShellFuncs
#------------------------------
# -- coloured manuals
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

#------------------------------
# Comp stuff
#------------------------------
zmodload zsh/complist
autoload -Uz compinit
compinit
zstyle :compinstall filename '${HOME}/.zshrc'
# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

#- buggy
# zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
# zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
#-/buggy

zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always
# zstyle -d ':prompt-theme cleanup'
# ------------------------------
# Bind Keys
#------------------------------
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

#------------------------------
# Some options
#------------------------------
setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

#------------------------------
# Antigen stuff
#------------------------------
#
antigen use oh-my-zsh

antigen bundle git
antigen bundle repo
antigen bundle zsh-users/zsh-completions
antigen bundle twang817/zsh-clipboard
antigen bundle zsh-users/zsh-syntax-highlighting
# antigen theme https://github.com/wesbos/Cobalt2-iterm cobalt2
# antigen theme oxide
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle gradle/gradle-completion
antigen bundle chrissicool/zsh-bash
antigen apply
