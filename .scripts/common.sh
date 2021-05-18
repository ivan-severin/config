#!/bin/sh

function perror () {
    local RED='\033[0;31m'
    local NC='\033[0m' # No Color
    printf "${RED}Error:${NC} $@\n" >&2
}

function do_if_you_can() {
    local cmd=$1
    if [ -n "$(command -v $cmd)" ]; then 
        $cmd ${@:2};
    else 
        perror "Command $cmd not found!"; 
        return -1;
    fi
}


