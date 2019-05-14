#!/usr/bin/env bash

_hawkbit_completion() {
    # echo "${#COMP_WORDS[@]}"
    if [[ "${COMP_WORDS[1]}" == "tags" ]] && [[ "${#COMP_WORDS[@]}" -le 3 ]]; then
        COMPREPLY=($(compgen -W "-h --help list assigned create delete add" -- "${COMP_WORDS[2]}"))
    elif [ "${COMP_WORDS[1]}" == "targets" ]; then
        COMPREPLY=($(compgen -W "-h --help list show" -- "${COMP_WORDS[2]}"))
    elif [[ "${#COMP_WORDS[@]}" -le 3 ]]; then
        COMPREPLY=($(compgen -W "-h --help tags targets" -- "${COMP_WORDS[1]}"))
    fi
}

complete -F _hawkbit_completion ./hawkbitctl
