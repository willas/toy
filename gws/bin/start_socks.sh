#!/bin/bash
source /etc/profile

while true; do
    ssh chenfei@47.90.42.37 -N -D $1 >> /dev/null 2>&1
    sleep 1
done
