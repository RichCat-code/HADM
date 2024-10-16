#!/usr/bin/bash

sudo apt-get install sysstat smartmontools -y > /dev/null

case $? in
    0)
        printf "Success, exiting...\n"
        exit $?
    ;;
    *)
        printf "Fail, exiting...\n"
        exit $?
    ;;
    esac