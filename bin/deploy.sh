#!/bin/bash

if [ -n "$BASH" ]; then
    set -o pipefail

    SOURCE="${BASH_SOURCE[0]}"
    while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
        HERE="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
        SOURCE="$(readlink "$SOURCE")"
        [[ $SOURCE != /* ]] && SOURCE="$HERE/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    done
    HERE="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"


elif [ -n "$ZSH_NAME" ]; then
    HERE="${0:A:h}"
fi

function log() {
    echo $(date +%Y.%m.%d-%H.%M.%S):$$ $*
}

cygwin=false
darwin=false
DATE_BIN=$(which date)
FIND_BIN=$(which find)
STAT_BIN=$(which stat)
case "$(uname)" in
    CYGWIN*)
        cygwin=true
        ;;
    Darwin*)
        darwin=true
        DATE_BIN=gdate
        FIND_BIN=gfind
        STAT_BIN=gstat
        ;;
esac


set -eu

THISBIN="$(basename $0)"
LOCK="$HERE"/"$THISBIN".lock

NOW=$(date +%Y-%m-%dT%H:%M:%S)
TIMESTAMP=$(date +%Y-%m-%d.%H-%M-%S)

log Starting ${THISBIN}.

if ! mkdir "$LOCK" 2>/dev/null; then
    log "Couldn't get lock on $THISBIN". Exiting.
    exit
fi

SCRIPT_STARTED=$(date +%s)
function cleanup() {
    rm -rf "$LOCK" 2>/dev/null
    SCRIPT_TOOK=$(( $(date +%s) - SCRIPT_STARTED ))
    log Ending.  Runtime: $(date -u -d @${SCRIPT_TOOK} +"%T")
}

trap cleanup EXIT

cd "$HERE"
cd ..
JEKYLL_ENV=production bundle exec jekyll build
if [ "$(hostname)" = "unixgeek-s-1vcpu-2gb-nyc3-01-2026-01-26" ]; then
    rsync -arvz --stats --progress  _site/* $HOME/nginx/content/blog
else
    rsync -arvz --stats --progress  _site/* mcampbell@unixgeek.com:nginx/content/blog
fi
