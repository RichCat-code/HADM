#!/usr/bin/bash
set -e

keep_alive_hw=true

tasks_func() {
    top -n 1 -b >../data/stats.txt
    line_count=$(cat ../data/stats.txt | wc -l)
    awk 'NR>=1 && NR<=2' ../data/stats.txt
    awk "NR>=6 && NR<=${line_count}" ../data/stats.txt
}
cpu_func() {
    top -n 1 -b >../data/stats.txt
    line_count=$(cat ../data/stats.txt | wc -l)
    awk 'NR==3' ../data/stats.txt
}
ram_func() {
    top -n 1 -b >../data/stats.txt
    line_count=$(cat ../data/stats.txt | wc -l)
    awk 'NR>=4 && NR<=5' ../data/stats.txt
}
spec_ram_func() {
    free
}

main_hw_func() {
    while [[ $keep_alive_hw == true ]]; do
        clear
        printf "Action? /%s [help]:" "$1"
        read -r hard_sub
        case $hard_sub in
        Cpu | cpu | CPU)
            clear
            echo "CPU"
            cpu_func
            printf "\nPress Enter to return"
            read >/dev/null
            ;;
        Ram | ram | RAM)
            clear
            printf "Short/Long?\n[short/long]:"
            read -r spec_ram
            case $spec_ram in
            Short | short | SHORT)
                clear
                ram_func
                printf "\nPress Enter to return"
                read >/dev/null
                ;;
            Long | long | LONG)
                clear
                spec_ram_func
                printf "\nPress Enter to return"
                read >/dev/null
                ;;
            esac
            ;;
        Tasks | tasks | TASKS)
            clear
            echo "Tasks"
            tasks_func
            printf "\nPress Enter to return"
            read >/dev/null
            ;;
        Complete | complete | COMPLETE)
            cpu_func
            spec_ram_func
            tasks_func
            printf "\nPress Enter to return"
            read >/dev/null
            ;;
        Back | back | BACK)
            keep_alive_hw=false
            ;;
        Exit | exit | EXIT)
            echo "Understood, exiting code 0"
            exit 0
            ;;
        Help | help | HELP)
            clear
            printf "[cpu/ram/tasks/complete/back/exit/help/]\n\ncpu: Gives details on CPU\nram: Gives details on RAM\ntasks: Gives details on active tasks\ncomplete: Gives complete details of top.\nback: Go back 1 step\nexit: Exit programme with code 0\nhelp: Get this options list.\n"
            printf "\nPress Enter to return"
            read >/dev/null
            ;;
        "")
            echo "Empty statement, try again!"
            sleep 1
            ;;
        *)
            echo "Invalid, try again!"
            sleep 1
            ;;
        esac
    done
    keep_alive_hw=true
}
