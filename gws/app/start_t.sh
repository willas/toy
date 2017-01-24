#!/bin/bash

ps aux|grep supervisord|grep -v grep |awk '{print $2}' | xargs kill -9
ps aux|grep 1280|grep -v grep |awk '{print $2}' | xargs kill -9

/usr/local/bin/supervisord -c START_SUPERVISOR_CONF
