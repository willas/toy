#!/bin/bash

ps aux|grep supervisord|grep -v grep |awk '{print $2}' | xargs kill -9
ps aux|grep 126|grep -v grep |awk '{print $2}' | xargs kill -9
pkill nginx

/usr/bin/supervisord -c START_SUPERVISOR_CONF
