#!/bin/bash
#This script working on centos6  install mongodb3.0.1 with WiredTiger
sudo yum install tar wget -y

mkdir -p /opt/bin
mkdir -p /opt/config
touch /opt/config/mongodb

cd /opt/bin
wget -O mongodb-start https://raw.githubusercontent.com/veeru538/Scripts/master/625-mongodb-start.sh
wget -O mongodb-stop https://raw.githubusercontent.com/veeru538/Scripts/master/626-mongodb-stop.sh 
chmod +x /opt/bin/*

wget -O init-rpm.sh https://raw.githubusercontent.com/veeru538/Scripts/master/init-rpm.sh
mv init-rpm.sh /etc/init.d/mongodb
chmod +x /etc/init.d/mongodb
chkconfig --add mongodb
chkconfig mongodb on
cd /opt

wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.0.1.tgz
tar zxf mongodb-linux-x86_64-3.0.1.tgz
mv mongodb-linux-x86_64-3.0.1  mongodb
useradd -M -r --home-dir /opt/mongodb mongodb

cat <<EOF > /opt/mongodb/mykey

GGGXXXEDR53232345667211MMMD8SFCISNN

EOF

chown mongodb:mongodb /opt/mongodb/mykey

chmod 600 /opt/mongodb/mykey

mkdir -p /dbStore/data

mkdir -p /dbStore/log

mkdir -p /dbStore/journal

chown -R mongodb:mongodb /dbStore/data

chown -R mongodb:mongodb /dbStore/log

chown -R mongodb:mongodb /dbStore/journal

## Update mongod configuration

cat <<EOF > /opt/config/mongodb.conf

storage:
    dbPath: "/dbStore/data"
    directoryPerDB: true
    journal:
         enabled: true 
    engine: "wiredTiger"
    wiredTiger:
        engineConfig: 
            cacheSizeGB: 1
            journalCompressor: zlib
        collectionConfig: 
            blockCompressor: zlib   
systemLog:
    destination: file
    path: "/dbStore/log/mongo.log"
    logAppend: true
    timeStampFormat: iso8601-utc
processManagement:
    fork: true
net:
    bindIp: "127.0.0.1,172.16.0.41"
    port: 27019
security:
    keyFile: "/opt/mongodb/mykey"
    authorization: "enabled"
sharding:
    clusterRole: "configsvr"

EOF
export LC_ALL=C
export PATH="/opt/mongodb/bin:$PATH"

#/etc/init.d/mongodb start
