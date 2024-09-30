#!/usr/bin/bash
set -e

#* File located in  /data/io_data.txt & /data/io_data_spec.txt

keep_alive_io=true
keep_alive_io_smart=true
scan_func() {
    clear
    sudo smartctl --scan
    printf "\nPress Enter to return"
    read >/dev/null
}

retrieve_func() {
    clear
    printf "/%s/%s/%s\n" "$1" "$spec_drive" "$sub_spec_drive"
    printf "Name of drive?[{Name}/All]"
    read -r drive_name
    case $drive_name in
    "")
        printf "Nothing entered, try again!"
        sleep 1
        ;;
    all | ALL | All)
        iostat --pretty -x -t >../data/io_data.txt
        printf "\nPress Enter to return"
        read >/dev/null
        ;;
    *)
        iostat $drive_name --pretty -t >../data/io_data_spec.txt
        line_count=$(cat ../data/io_data_spec.txt | wc -l)
        awk "NR>=7 && NR<=${line_count}" ../data/io_data_spec.txt
        printf "Press Enter to return"
        read >/dev/null
        ;;
    esac
}

main_smart_func() {
    while [[ $keep_alive_io == true ]]; do
        clear
        printf "Action? /%s [help]" "$1"
        read -r spec_drive
        case $spec_drive in
        SMART | smart | Smart)
            while [[ $keep_alive_io_smart == true ]]; do
                clear
                printf "S.M.A.R.T"
                sleep 1
                clear
                printf "Action? /%s/%s [help]" "$1" "$spec_drive"
                read -r sub_spec_drive
                case $sub_spec_drive in
                SCAN | scan | Scan)
                    scan_func
                    ;;
                RETRIEVE | retrieve | Retrieve)
                    retrieve_func $1 $spec_drive $sub_spec_drive
                    ;;
                Back | back | BACK)
                    keep_alive_io_smart=false
                    ;;
                Help | help | HELP)
                    clear
                    printf "[scan/retrieve]\n\nscan: Scans for storage devices\nretrieve: Retrieves info about specified device"
                    printf "\n\nPress Enter to return"
                    read >/dev/null
                    ;;
                Exit | exit | EXIT)
                    echo "Understood, exiting code 0"
                    exit 0
                    ;;
                *)
                    echo "Nothing"
                    ;;
                esac
            done
            keep_alive_io_smart=true
            ;;
        BACK | back | Back)
            keep_alive_io=false
            ;;
        EXIT | exit | Exit)
            echo "Understood, exiting code 0"
            exit 0
            ;;
        HELP | help | Help)
            clear
            printf "[smart/back/exit/help]\nsmart: S.M.A.R.T utils\nback: Go back 1 step\nexit: Exit programme with code 0\nhelp: Get this options list."
            printf "\n\nPress Enter to return"
            read >/dev/null
            ;;
        *)
            clear
            echo "Nothing"
            sleep 4
            ;;
        esac
    done
    keep_alive_io=true
}
