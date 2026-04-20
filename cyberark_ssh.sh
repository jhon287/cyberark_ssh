#!/usr/bin/env bash

function usage {
    echo "$0 [-a CYBERARK_ADDRESS] [-h] [-j CYBERARK_JUMP_HOST] [-n CYBERARK_USERNAME] [-u CYBERARK_SSH_USER] DST_SERVER"
}

function main() {
    CYBERARK_ADDRESS="#cyberark-address"
    CYBERARK_JUMP_HOST=jump-server-123.example.com
    CYBERARK_SSH_USER="$(ssh -G ${CYBERARK_JUMP_HOST} | grep "^user " | cut -d " " -f 2)"
    CYBERARK_USERNAME=LINUX_SRV_1

    while getopts ":a:j:n:u:h" opt
    do
        case "${opt}" in
            a) CYBERARK_ADDRESS="${OPTARG}";;
            h) usage && exit 0;;
            j) CYBERARK_JUMP_HOST="${OPTARG}";;
            n) CYBERARK_USERNAME="${OPTARG}";;
            u) CYBERARK_SSH_USER="${OPTARG}";;
        esac
    done
    shift $((OPTIND - 1))

    if [ -n "${1}" ]
    then
        MY_DST_SERVER="${1}"
    else
        usage && exit 1
    fi

    ssh -oStrictHostKeyChecking=False \
        -oUserKnownHostsFile=/dev/null \
        -oUser="${CYBERARK_SSH_USER}@${CYBERARK_USERNAME}${CYBERARK_ADDRESS}@${MY_DST_SERVER}" \
        "${CYBERARK_JUMP_HOST}"
}

main "$@"
