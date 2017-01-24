#!/bin/bash
source /etc/profile

exec ssh root@4.9.4.3 -N -D $1 >> /dev/null 2>&1
