#!/bin/bash

if [ -z "$1" ]; then
    docker exec -it g6k bash
elif [ $1 == "detach" ]; then
    docker exec -t -d g6k bash -c /root/source_this.sh
fi
