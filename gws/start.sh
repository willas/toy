#!/bin/bash

ps aux|grep supervisord|grep -v grep |awk '{print $2}' | xargs kill -9
ps aux|grep start_socks.sh|grep -v grep |awk '{print $2}' | xargs kill -9
ps aux|grep 126|grep -v grep |awk '{print $2}' | xargs kill -9
pkill nginx
sleep 1

# reload proxy.pac

if [ "$1" == "" ];then
    ln -sf /opt/toy/gws/app/config/pac/proxy_office.pac /opt/toy/gws/app/config/pac/proxy.pac 
else
    ln -sf /opt/toy/gws/app/config/pac/proxy_home.pac /opt/toy/gws/app/config/pac/proxy.pac
fi

/usr/local/bin/supervisord -c /opt/toy/gws/app/config/supervisor/supervisor.conf 
