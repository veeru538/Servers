#!/bin/bash
## THIS Script for redis-server installation with sentinel mode 
yum -y update
yum -y install gcc gcc-c++ make wget
#######################################
# Download and install Redis:
#######################################
version=2.8.12
wget -q http://download.redis.io/releases/redis-$version.tar.gz
tar xzf redis-$version.tar.gz
rm -f redis-$version.tar.gz
cd redis-$version
make
make install
#######################################
# Set up Redis
#######################################
rm -rf /etc/redis /var/lib/redis
mkdir /etc/redis /var/lib/redis
cp src/redis-server src/redis-cli src/redis-sentinel  /usr/local/bin
cp redis.conf /etc/redis
cp sentinel.conf /etc/redis
sed -e "s/^daemonize no$/daemonize yes/" -e "s/^# bind 127.0.0.1$/bind 0.0.0.0/" -e "s/^dir \.\//dir \/var\/lib\/redis\//" -e "s/^loglevel verbose$/loglevel notice/" -e "s/^logfile stdout$/logfile \/var\/log\/redis.log/" redis.conf > /etc/redis/redis.conf
#######################################
# Redis correctly installed.
# Download redis-server init script
#######################################
wget -q https://github.com/veeru538/Scripts/blob/master/redis-server
mv redis-server /etc/init.d
chmod 755 /etc/init.d/redis-server
chkconfig --add redis-server
chkconfig --level 345 redis-server on
