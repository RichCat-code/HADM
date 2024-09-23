#!/usr/bin/bash

scan_func() {
    clear
    sudo smartctl --scan
    sleep 5
}
retrieve_func() {
    printf "Name of drive?"
    read -r drive_name
    case $drive_name in
    "")
        echo "Nothing entered, cancelling\n Exiting code 0"
        ;;
    *)
        echo $drive_name
        ;;
    esac
}
