#!/bin/bash

count=`ps aux|grep 128|grep "root@" |wc -l`

time="`date +%d/%b/%Y:%H:%M`"

echo "$time run!"

if [ $count -lt 9 ]; then 
    echo "$time restart !"
    sh start.sh
fi
