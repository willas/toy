#!/bin/bash
if [ "$0" != "install.sh" ];then
    echo "please enter dir...";
    exit;
fi
APP_ROOT=/opt/toy/gws/app
USER=`who |awk '{print $1}'`

echo $APP_ROOT;

#install nginx
cd nginx-1.11.2
#sh configure --with-stream --prefix=$APP_ROOT/nginx && make && make install
cd ..

rm -rf  $APP_ROOT/nginx/conf/nginx.conf
ln -sf $APP_ROOT/config/nginx/nginx.conf $APP_ROOT/nginx/conf/nginx.conf
ln -sf $APP_ROOT/config/nginx/sites.d $APP_ROOT/nginx/conf/sites.d



#install supervisor
cd supervisor-3.3.1
python setup.py install  >> /dev/null 2>&1
cd ..
