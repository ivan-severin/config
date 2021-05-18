#!/bin/sh 

source $HOME/.scripts/common.sh

function ggrep()
{
    find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f -name "*\.gradle" \
        -exec grep --color -n "$@" {} +
}

function jgrep()
{
    find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f -name "*\.java" \
        -exec grep --color -n "$@" {} +
}

function cgrep()
{
    find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f \( -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.h' -o -name '*.hpp' \) \
        -exec grep --color -n "$@" {} +
}

function resgrep()
{
    local dir
    for dir in `find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -name res -type d`; do
        find $dir -type f -name '*\.xml' -exec grep --color -n "$@" {} +
    done
}

function mangrep()
{
    find . -name .repo -prune -o -name .git -prune -o -path ./out -prune -o -type f -name 'AndroidManifest.xml' \
        -exec grep --color -n "$@" {} +
}

function sepgrep()
{
    find . -name .repo -prune -o -name .git -prune -o -path ./out -prune -o -name sepolicy -type d \
        -exec grep --color -n -r --exclude-dir=\.git "$@" {} +
}

function rcgrep()
{
    find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f -name "*\.rc*" \
        -exec grep --color -n "$@" {} +
}

# function rcgrep()
# {
# find -E . -name .repo -prune -o -name .git -prune -o  -type f -iregex '.*\.(c|h|cc|cpp|hpp|S|java|xml|sh|mk|aidl|vts)' \
#                 -exec grep --color -n "$@" {} +
# }

function picker() {
    local selector=fzy
    if [ $# -lt 2 ]; then 
        perror "Invlid number of arguments!";
        return -1;
    fi

    local grepped=$(do_if_you_can $1 --color=always  ${@:2}) 

    if [ -n "$grepped" ]; then
        local selected=$(printf "$grepped" | $selector);
        local clean_selected=$(printf "$selected" | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g");
        printf "$clean_selected";
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
        local arg=$(printf "$line" | awk -F ":" '{print $1 " +" $2}');
        printf "$arg" | xargs bash -c '</dev/tty ${EDITOR} "$@"' ignoreme;
    done;
}

function jpick()   { picker jgrep ${@:1}           | to_vim ; }
function cpick()   { picker cgrep ${@:1}           | to_vim ; }
function mpick()   { picker mgrep ${@:1}           | to_vim ; }
function manpick() { picker mangrep ${@:1}         | to_vim ; }
function respick() { picker resgrep ${@:1}         | to_vim ; }
function seppick() { picker sepgrep ${@:1}         | to_vim ; }
function spick()   { picker sgrep ${@:1}           | to_vim ; }
function pick()    { picker grep -rsnI . ${@:1}    | to_vim ; }

