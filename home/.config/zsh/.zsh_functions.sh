#!/bin/env zsh

#
# .zfunctions.zsh - Set whatever shell functions you want.
#

ECHOCAT '.zfunctions.zsh - Set whatever shell functions you want.'

hping() {
  ping -c 3 -s 2 "$1"
}
fping() {
  ping -c 20 -s 2 "$1"
}
chx() {
  chmod +x "$1"
}
chxr() {
  chmod -R +x "$1"
}
hg() {
  history | grep "$1" # +command
}
psa() {
  sudo ps -aux
}
if command -v systemctl &>/dev/null; then
    # Basic systemctl commands
    # Daemons reload
    # Credits to: https://gist.github.com/Feniksovich
    # Enable/Disable commands for units
    # Start and then view status of service
    ctlsts() {
        sudo systemctl start "$1"
        sudo systemctl status "$1"
    }
    # Restart and then view status of service
    ctlrts() {
        sudo systemctl restart "$1"
        sudo systemctl status "$1"
    }
    # Stop and then view status of service
    ctlsps() {
        sudo systemctl stop "$1"
        sudo systemctl status "$1"
    }
    _ctl_completion() {
        local cur=${COMP_WORDS[COMP_CWORD]}
        local services=$(systemctl list-unit-files --type=service --state=enabled,disabled | awk '{print $1}')
        COMPREPLY=( $(compgen -W "ctlsts ctlrts ctlsps $services" -- $cur) )
    }
    complete -F _ctl_completion ctlsts
    complete -F _ctl_completion ctlrts
    complete -F _ctl_completion ctlsps
    # Masking Units to disabling them
    # List failed units and reset systemd system status
    ### Start of ctlact block
    # The ctlact function is a utility for managing systemd services.
    # It takes an action (start, stop, restart, or status) as the first argument
    # and one or more service names as additional arguments.
    # The function performs the specified action on all the specified services
    # and then displays their status.
    #
    # Usage: ctlact ACTION SERVICE [SERVICE...]
    #
    # Examples:
    #   ctlact restart apache2 nginx
    #   ctlact status sshd
    # Credits: ChatGPT
    ctlact() {
      local action=$1
      shift
      for service in "$@"; do
        systemctl $action $service
        systemctl status $service
      done
    }
    _ctlact() {
        local cur prev opts
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        prev="${COMP_WORDS[COMP_CWORD-1]}"
        opts="start stop restart status"
        if [[ ${prev} == ctlact ]]; then
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
        fi
        if [[ ${prev} == start || ${prev} == stop || ${prev} == restart || ${prev} == status ]]; then
            COMPREPLY=( $(compgen -W "$(systemctl list-unit-files --type=service | awk '{print $1}')" -- ${cur}) )
            return 0
        fi
    }
    complete -F _ctlact ctlact
fi
### End of ctlact block
if command -v fwupdmgr &>/dev/null; then
    fwcheck() {
        sudo fwupdmgr refresh --force
        sudo fwupdmgr get-updates
    }
fi
if command -v git &>/dev/null; then
    function dotfiles {
        git --git-dir="$HOME"/.dotfiles_git/ --work-tree="$HOME" "$@"
    }
fi
installKubectl() {
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
    echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
    if [[ $? == 0 ]]; then
        chmod +x kubectl
        mkdir -p ~/.local/bin
        mv ./kubectl ~/.local/bin/kubectl
    fi
}
if command -v docker &>/dev/null; then
    source <(docker completion zsh)
    watchtower() {
        docker login
        docker run -d \
            --name watchtower \
            -v "$HOME"/.docker/config.json:/config.json \
            -v /var/run/docker.sock:/var/run/docker.sock \
            containrrr/watchtower --interval 60
    }
fi
if [[ $(command -v remmina) ]]; then
    rdp() {
        [ "$1" ] && remmina -c rdp://"$1" &
    }
    vnc() {
        [ "$1" ] && remmina -c vnc://"$1" &
    }
fi
if [[ $(command -v flatpak) ]]; then
    if [[ $(flatpak list | grep -i com.visualstudio.code) ]]; then
        code() {
            flatpak run com.visualstudio.code "$1" &
        }
    fi
fi
if command -v curl &>/dev/null; then
    # Creditst to Jeremy "Jay" LaCroix
    # <https://www.learnlinux.tv/10-linux-terminal-tips-and-tricks-to-enhance-your-workflow/
    c() {
        # Ask cheat.sh website for details about a Linux command.
        curl -m 10 "http://cheat.sh/${1}" 2>/dev/null || printf '%s\n' "[ERROR] Something broke"
    }
    wth() {
        curl -m 10 "https://wttr.in/${1}" 2>/dev/null || printf '%s\n' "[ERROR] Something broke"
    }
fi
# This script defines a function named `checkSum` that can be used to verify the
# checksum of a file using a specified algorithm. The function takes three arguments:
# the algorithm to use (md5, sha1, sha256, or sha512), the file to check, and the
# expected checksum value. The function calculates the checksum of the given file
# using the specified algorithm and compares it to the expected value. If the calculated
# and expected values match, it prints a message indicating that the checksum is OK;
# otherwise, it prints a message indicating that the checksum is not OK.
#
# Usage: checkSum [md5|sha1|sha256|sha512] [file] [sum]
#
# Example: checkSum md5 myfile.txt d41d8cd98f00b204e9800998ecf8427e
checkSum() {
    if [ "$1" = "--help" ]; then
        echo "Usage: checkSum [md5|sha1|sha256|sha512] [file] [sum]"
        return 0
    fi
    if [ "$#" -ne 3 ]; then
        echo "Error: Invalid number of arguments"
        echo "Usage: checkSum [md5|sha1|sha256|sha512] [file] [sum]"
        return 2
    fi
    local algorithm="$1"
    local file="$2"
    local expected_sum="$3"
    if ! [[ "$algorithm" =~ ^(md5|sha1|sha256|sha512)$ ]]; then
        echo "Error: Invalid algorithm"
        echo "Algorithm (first parameter) must be one of: md5, sha1, sha256, sha512"
        return 3
    fi
    if [ ! -f "$file" ]; then
        echo "Error: File not found"
        echo "File (second parameter) must be a valid file path"
        return 4
    fi
    local command="${algorithm}sum"
    if ! command -v "$command" &>/dev/null; then
        echo "Error: Command not found"
        echo "Command ${command} is not installed on this system"
        return 5
    fi
    local calculated_sum=$("$command" "$file" | cut -d ' ' -f 1)
    echo "Given: $expected_sum"
    echo "Calculated: $calculated_sum"
    if [ "$(echo "$calculated_sum" | tr '[:upper:]' '[:lower:]')" = "$(echo "$expected_sum" | tr '[:upper:]' '[:lower:]')" ]; then
        if [ "$calculated_sum" != "$expected_sum" ]; then
            echo "Warning: Case mismatch between given and calculated checksums"
        fi
        echo "${command} OK"
        return 0
    else
        echo "${command} NOT OK!!"
        return 1
    fi
}
if [ -n "$BASH_VERSION" ]; then
    # Bash completion function
    _checkSum() {
        local cur prev words cword
        _init_completion || return
        case $prev in
            checkSum)
                COMPREPLY=($(compgen -W "md5 sha1 sha256 sha512 --help" -- "$cur"))
                return 0
                ;;
        esac
        _filedir
    }
    complete -F _checkSum checkSum
elif [ -n "$ZSH_VERSION" ]; then
    # Zsh completion function
    #compdef checkSum
    _checkSum() {
        local curcontext="$curcontext" state line expl ret=1
        _arguments -C \
          '1: :->algorithm' \
          '2: :_files' \
          '*::arg:->args' && ret=0
        case $state in
          (algorithm)
              _wanted algorithm expl 'algorithm' compadd md5 sha1 sha256 sha512 --help && ret=0
              ;;
          (args)
              _message 'checksum value'
              ret=0
              ;;
          (*) 
              ret=1 
              ;;
        esac
        return ret
    }
    compdef _checkSum checkSum
fi
# End of checkSum block
getCharge() {
    local mode=$(sudo cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode)
    echo "Conservation mode: ${mode}"
}
stopCharge() {
    echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
}
startCharge() {
    echo 0 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
}
# Credits to Connor - https://stackoverflow.com/questions/24283097/reusing-output-from-last-command-in-bash
# Usage
# $ find . -name 'filename' | cap
# /path/to/filename
#
# $ ret
# /path/to/filename
# capture the output of a command so it can be retrieved with ret
cap() { tee /tmp/capture.out; }
# return the output of the most recent command that was captured by cap
ret() { cat /tmp/capture.out; }
#launch interception-tolls in background
interception() {
  sudo ln -sf /usr/lib64/libyaml-cpp.so.0.7.0 /usr/lib64/libyaml-cpp.so.0.6
  sudo /usr/bin/udevmon -c /etc/interception/udevmon.yaml &;
  sudo nice -n -20 udevmon
}
#Converts all .wav to .mp3 in the current git-dir
convertMp3Wav() {
  mkdir wav; for i in *.mp3; do ffmpeg -i "$i" "./wav/${i%.*}.wav"; done
}
fortibug() {
   echo "Try to connect to the VPN now"
  x=99
  while [ $x -ne 0 ]
  do
    echo "Waiting for VPN connection..."
    sleep 1
    connection=$(nmcli connection show | grep -oP '^vpn\S*')
    x=$?
  done
  echo "VPN connection $connection was created! Waiting for 'device-reapply'..."
  x=99
  while [ $x -ne 0 ]
  do
    nmcli -f GENERAL.STATE con show $connection 2> /dev/null
    x=${PIPESTATUS[0]}
    sleep 1
    echo "Still waiting..."
  done
  echo "Device is unmanaged. Setting it to 'up' again..."
  nmcli con up $connection 2> /dev/null
  echo "Done."
}
stopDaemons() {
  sudo systemctl stop cyservice.service sentinelone.service dcservice.service SysAidAgent.service SysAidSessionUtilities.service
  sudo systemctl status cyservice.service sentinelone.service dcservice.service SysAidAgent.service SysAidSessionUtilities.service
}
### GREAT SCRIPTS TO MOUNT SSHFS AND DINAMYCALLY CREATE AND DESTROY MOUNT POINTS
### WITH AUTOCOMPLETE!!! Credits: ChatGPT
# Define an empty array to store the attached servers
ATTACHED_SERVERS=()
# Define a function to add a server to the ATTACHED_SERVERS array
add_attached_server() {
    local server_name="$1"
    if ! [[ " ${ATTACHED_SERVERS[@]} " =~ " ${server_name} " ]]; then
        ATTACHED_SERVERS+=("$server_name")
    fi
}
# Define a function to remove a server from the ATTACHED_SERVERS array
remove_attached_server() {
    local server_name="$1"
    ATTACHED_SERVERS=("${ATTACHED_SERVERS[@]/$server_name}")
}
# Define a function to mount a remote directory using sshfs
sshmount() {
    # Set the server name, user, and port from the arguments
    SERVER_NAME="$1"
    SSH_USER="$2"
    SSH_PORT="$3"
    # Set the remote directory to mount
    REMOTE_DIR="/"
    # Set the local mount point
    MOUNT_POINT="$HOME/mnt/$SERVER_NAME"
    # Create the mount point if it does not exist
    if [ ! -d "$MOUNT_POINT" ]; then
        mkdir -p "$MOUNT_POINT"
    fi
    # Build the sshfs command with the specified user and port, if provided
    SSHFS_CMD="sshfs $SERVER_NAME:$REMOTE_DIR $MOUNT_POINT"
    if [ -n "$SSH_USER" ]; then
        SSHFS_CMD="$SSHFS_CMD -o User=$SSH_USER"
    fi
    if [ -n "$SSH_PORT" ]; then
        SSHFS_CMD="$SSHFS_CMD -o Port=$SSH_PORT"
    fi
    # Mount the remote directory using sshfs
    if eval $SSHFS_CMD; then
        # Add the server name to the ATTACHED_SERVERS array
        add_attached_server "$SERVER_NAME"
    fi
}
# Define a function to unmount a remote directory and remove the local mount point
sshumount() {
    # Set the server name from the first argument
    SERVER_NAME="$1"
    # Set the local mount point
    MOUNT_POINT="$HOME/mnt/$SERVER_NAME"
    # Unmount the remote directory using fusermount
    fusermount -u $MOUNT_POINT
    # Remove the local mount point directory
    rmdir $MOUNT_POINT
    # Remove the server name from the ATTACHED_SERVERS array
    remove_attached_server "$SERVER_NAME"
}
# Define a custom completion function for the sshmount and sshumount functions
_sshmount_completion() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -W "${ATTACHED_SERVERS[*]}" -- "$cur") )
}
# Register the custom completion function for the sshmount and sshumount functions
complete -F _sshmount_completion sshmount sshumount
### END OF SSHFS SCRIPTS BLOCK
# Update pip packages
pip_update() {
  pip --disable-pip-version-check list --outdated --format=json | python -c "import json, sys; print('\n'.join([x['name'] for x in json.load(sys.stdin)]))" | xargs -n1 pip install -U
}
pip_update_user() {
  pip --disable-pip-version-check list --user --outdated --format=json | python -c "import json, sys; print('\n'.join([x['name'] for x in json.load(sys.stdin)]))" | xargs -n1 pip install --user -U
}
vmware_scan_new_disk() {
  for host in /sys/class/scsi_host/*
  do
    echo "- - -" | sudo tee $host/scan
    ls /dev/sd*
  done
}
