#!/usr/bin/bash
set -e
# * Install script, installs all libraries needed.
# * Uninstall script, able to uninstall needed libraries/dependencies
pkgs=("smartmontools" "procps" "coreutils" "gawk" "sysstat")
op=true

install() {
    if [[ -z $1 ]]; then
        op=true
        echo $op
    elif [[ $1 = "Install" || $1 = "INSTALL" || $1 = "install" ]]; then
        op=true
        echo $op
        clear
        case $EUID in
        0)
            clear
            echo "Installing required tools started"
            echo "Cancel with CTRL^C"
            sleep 4
            
            apt-get install "$i" -y >/dev/null
            # shellcheck disable=SC2302
            for i in "${pkgs[@]}"; do
                apt_exit_code=$?
                case $? in
                1)
                    echo "General error"
                    printf "\n Exiting code %d" "$apt_exit_code"
                    ;;
                100)
                    echo "Config error, maybe re-write config files?"
                    printf "\n Exiting code %d" "$apt_exit_code"
                    ;;
                0)
                    clear
                    printf "%s installed or uppgraded" "$i"
                    sleep 3
                    ;;
                *)
                    clear
                    printf "\n Unknown error, exiting code %d" "$?"
                    ;;
                esac
            done
            clear
            echo "Exited with success, code 0"
            clear
            echo "Finished! Have fun! :D"
            sleep 2
            exit 0
            ;;
        *)
            clear
            printf "Sudo priveleges are needed, retry as sudo!"
            sleep 2
            exit 1
            ;;
        esac
    elif [[ $1 = "Uninstall" || $1 == "UNINSTALL" || $1 = "uninstall" ]]; then
        echo "False"
    fi
}
install "$1"
