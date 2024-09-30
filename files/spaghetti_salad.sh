#!/usr/bin/bash

# ! Set's file to exit on err. Info displayed is not guaranteed.
set -e
#   This file is the main file for the program, execute this program when in use.
#   File imports for functions that run the entire thing.

source hardware_spyware.sh
source smart_clown.sh
source io_druid.sh

# * "keep_alive var declared to make the program loop."
keep_alive=true

# ! Loops ALL code while keep_alive == true, when false will exit the program in code 0
while [[ $keep_alive == true ]]; do
    clear
    printf "Action? / [help]: "
    read -r util
    # * Case statement checks for 5 specific inputs, one of them being empty, one being exit and one being help.
    case $util in
    HARDWARE | hardware | Hardware | hw)
        # * Function located in file "hardware_spyware.sh"
        main_hw_func $util
        ;;
    Drive | drive | DRIVE)
        # * Function located in file "smart_clown.sh"
        main_smart_func $util
        ;;
    exit)
        # * Exits program with code 0 (Success/No err's out)
        echo "Understood, exiting code 0"
        exit 0
        ;;
    HELP | help | Help)
        # * Displays help text with what options are available for input. It is shodily written so excuse me for that :') 
        clear
        printf "[hardware/drive/exit/]\n\nhardware: Show stats of hardware\ndrive: Show stats/utils for drives\nexit: Exit programme with code 0\nhelp: Get this options list."
        printf "\n\nPress Enter to return"
        # * Sends input to /dev/null, which automatically disposes of all data. Essentially, it's an trashbin. :D
        read >/dev/null
    ;;
    *)
        clear
        printf "*buzzer!* WRONG, Try again!"
        sleep 2
        ;;
    esac
done
