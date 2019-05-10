#! /bin/bash 
source $HOME/.scripts/picker.sh

function alogof () {
    adb wait-for-device 
    local app_data=$(adb shell ps -A | picker grep $@)
    if [ -z "$app_data" ]; then
        # perror "App not found!";
        return  -1;
    fi

    local pid="$(echo -e $app_data | awk  '{print $2}' | head -1)"
    echo "Starting logcat for pid: $pid"
    adb logcat --pid $pid
}
