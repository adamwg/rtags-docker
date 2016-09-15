#!/bin/bash

set -e
set -x

: ${BUILD_CMD:=make}
: ${LISTEN_PORT:=12345}

if [[ -z $PROJECT_PATH ]]; then
    echo "PROJECT_PATH not specified"
    exit 1
fi

rdm --tcp-port=$LISTEN_PORT &
cd $PROJECT_PATH
bear $BUILD_CMD
rc -J .

wait
