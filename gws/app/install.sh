#!/bin/bash
if [ "$0" != "install.sh" ];then
    echo "please enter dir...";
    exit;
fi
APP_ROOT=`pwd`
ROOT=`dirname $APP_ROOT'../'`
USER=`who |awk '{print $1}'`

echo $APP_ROOT;
echo $ROOT;

#install nginx
cd nginx-1.11.2
sh configure --with-stream --prefix=$APP_ROOT/nginx && make && make install
cd ..

sed "s:PAC_WEB_DIR:$APP_ROOT/pac:g" nginx_t.conf > nginx/conf/nginx.conf 2>&1

#install supervisor
cd supervisor-3.3.1
python setup.py install  >> /dev/null 2>&1
cd ..

sed  "s:START_SOCKS_DIR:$ROOT/bin:g" supervisor_t.conf  > supervisor.conf.tmp 2>&1
sed  "s:NGINX_BASE_DIR:$APP_ROOT/nginx:g" supervisor.conf.tmp  > supervisor.conf.tmp1 2>&1
sed  "s:USER:$USER:g" supervisor.conf.tmp1  > supervisor.conf 2>&1
rm -rf supervisor.conf.tmp supervisor.conf.tmp1

sed  "s:START_SUPERVISOR_CONF:$ROOT/app/supervisor.conf:g" start_t.sh > $ROOT/start.sh 2>&1
