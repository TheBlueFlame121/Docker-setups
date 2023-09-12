#!/bin/bash

if [ -z "$1" ]; then
    docker exec -it flatter bash
elif [ $1 == "detach" ]; then
    docker exec -t -d flatter bash -c /root/source_this.sh
fi
