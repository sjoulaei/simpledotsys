#!/bin/bash

# Thanks to for the codes: https://github.com/arctelix/.dotsys
# Author: arctelix

# Executes commands as sudo only when necessary
dsudo () {

    # Check for real sudo (windows is bs)
    if ! sudo -h >/dev/null 2>&1 ; then "$@"; return $?; fi

    local result
    local rv
    result="$("$@" >/dev/null 2>&1)"
    rv=$?

    # Get sudo password if cmd fails and is required
    if ! [ $rv -eq 0 ] && ! sudo -n true >/dev/null 2>&1; then
#        task "The admin password is required to alter some files"
        sudo -v -p "$(printf "$spacer Enter password : ")"
    fi

    # Try sudo if original failed
    if ! [ $rv -eq 0 ];then
        sudo "$@"

    # echo the original result on success
    elif [ "$result" ];then
        echo "$result"
    fi

    return $?
}

