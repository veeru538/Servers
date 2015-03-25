
#############################################################
## NODEJS INSTALLATION  in LINUX
#############################################################

#!/bin/sh
yum update -y
yum install -y make gcc-c++ openssl-devel git wget
cd /usr/src/
wget http://nodejs.org/dist/v0.10.21/node-v0.10.21.tar.gz
tar zxf node-v0.10.21.tar.gz
cd node-v0.10.21
./configure
make
make install
cd /usr/local/lib
npm install forever -g
npm install amqp -g
npm install socket.io -g
