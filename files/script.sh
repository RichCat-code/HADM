#!/usr/bin/bash
source hardware.sh
source smart.sh

while true; do
    clear
    printf "\nWhatcha need?\n[hardware/Drive/exit/*]: "
    read -r util
    case $util in
    HARDWARE | hardware | hw)
        clear
        printf "\nChoose one\n[CPU/RAM/tasks/complete/exit/*]:"
        read -r hard_sub
        case $hard_sub in
        CPU | cpu | Cpu)
            clear
            echo "CPU"
            cpu_func
            sleep 4
            ;;
        RAM | ram)
            clear
            # echo "RAM"
            # ram_func
            # sleep 4
            printf "\nShort/Long?\n[short/long]:"
            read -r spec_ram
            case $spec_ram in
            SHORT | short | Short)
                clear
                ram_func
                sleep 5
                ;;
            LONG | long | Long)
                clear
                free
                sleep 5
                ;;
            esac
            ;;
        Tasks | tasks)
            clear
            echo "Tasks"
            proccess_func
            sleep 4
            ;;
        Complete | complete | COMPLETE)
            cpu_func
            spec_ram_func
            proccess_func
            sleep 10
            ;;
        Exit | exit)
            echo "Understood, exiting code 0"
            exit 0
            ;;
        *)
            echo "Nothing"
            ;;
        esac
        ;;
    Drive | drive | DRIVE)
        clear
        printf "\nAction?\n[SMART/Exit/*]"
        read -r spec_drive
        case $spec_drive in
        SMART | smart | Smart)
            clear
            echo "S.M.A.R.T"
            sleep 4
            printf "\nAction?\n[Scan/Retrieve/*]"
            read -r sub_spec_drive
            case $sub_spec_drive in
            SCAN | scan | Scan)
                scan_func
                ;;
            RETRIEVE | retrieve | Retrieve)
                retrieve_func
                ;;
            *)
                echo "Nothing"
                ;;
            esac
            ;;
        EXIT | exit | Exit)
            echo "Understood, exiting code 0"
            exit 0
            ;;
        *)
            clear
            echo "Nothing"
            sleep 4
            ;;
        esac
        ;;
    exit)
        echo "Understood, exiting code 0"
        exit 0
        ;;
    *)
        clear
        printf "I dont like you :'( \n Try again!"
        sleep 2
        clear
        ;;
    esac
done
