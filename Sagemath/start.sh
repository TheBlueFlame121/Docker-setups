#!/bin/bash

if [ -z "$1" ]; then
    docker exec -it sage bash
elif [ $1 == "detach" ]; then
    docker exec -t -d sage bash -c /root/source_this.sh
fi
