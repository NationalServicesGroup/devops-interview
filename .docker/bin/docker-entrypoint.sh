#!/bin/bash

set -eo pipefail
shopt -s nullglob


# check to see if this file is being run or sourced from another script
_is_sourced() {
    # https://unix.stackexchange.com/a/215279
    [ "${#FUNCNAME[@]}" -ge 2 ] &&
        [ "${FUNCNAME[0]}" = '_is_sourced' ] &&
        [ "${FUNCNAME[1]}" = 'source' ]
}

_main() {
    if [ "$1" == "shell" ]; then
        echo "Starting shell"
    else
        echo "Starting Zope"

    fi

}



# If we are sourced from elsewhere, don't perform any further actions
if ! _is_sourced; then
    _main "$@"
fi
