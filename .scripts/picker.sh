#!/bin/bash 

source $HOME/.scripts/common.sh

function picker() {
    local selector=fzy
    if [ $# -lt 2 ]; then 
        perror "Invlid number of arguments!";
        return -1;
    fi

    local grepped=$(do_if_you_can $1 --color=always  ${@:2}) 

    if [ -n "$grepped" ]; then
        local selected=$(echo $grepped | $selector);
        local clean_selected=$(echo $selected | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g");
        echo $clean_selected;
        return 0;
    else
        perror "Nothing to pick!";
        return -1;
    fi
}

function to_vim() {
    if [ -t 0 ]; then
        perror "Just Pipe mode, sorry!";
        return -1;
    fi

    while read -r line 
    do 
        local arg=$(echo $line | awk -F ":" '{print $1 " +" $2}');
        echo $arg | xargs bash -c '</dev/tty ${EDITOR} "$@"' ignoreme;
    done;
}

function jpick()   { picker jgrep ${@:1}           | to_vim }
function cpick()   { picker cgrep ${@:1}           | to_vim }
function mpick()   { picker mgrep ${@:1}           | to_vim }
function manpick() { picker mangrep ${@:1}         | to_vim }
function respick() { picker resgrep ${@:1}         | to_vim }
function seppick() { picker sepgrep ${@:1}         | to_vim }
function spick()   { picker sgrep ${@:1}           | to_vim }
function pick()    { picker grep -rsnI . -e ${@:1} | to_vim }
