#!/bin/bash
source /etc/profile

exec ssh root@47.90.42.37 -N -D $1 >> /dev/null 2>&1
