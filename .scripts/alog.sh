#! /bin/bash 
source $HOME/.scripts/picker.sh

function alogof () {
    adb wait-for-device 
    local app_data=$(adb shell ps -e | picker grep $@)
    if [ -z "$app_data" ]; then
        perror "App not found!";
        return  -1;
    fi
    local app_name="$(echo -e $app_data | awk '{print $9}')"

    while true; do
        local pid="$(adb shell pidof $app_name)"
        echo "Starting logcat for pid: $pid"
        adb wait-for-device
        adb logcat --pid $pid
    done
}
