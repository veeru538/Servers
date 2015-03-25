#!/bin/bash
sudo yum update -y
### ********** Install Oracle JDK 7 ************################
# Install Oracle Java 7 JRE
cd /opt
sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jre-7u71-linux-x64.tar.gz"
sudo tar xvf jre-7u71-linux-x64.tar.gz
sudo chown -R root: jre1.7.0_71

sudo alternatives --install /usr/bin/java java /opt/jre1.7.0_71/bin/java 1
sudo rm /opt/jre-7u71-linux-x64.tar.gz
#Install Oracle Java 7 JDK
cd /opt
sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz"
sudo tar xvf jdk-7u71-linux-x64.tar.gz
sudo chown -R root: jdk1.7.0_71

sudo alternatives --install /usr/bin/java java /opt/jdk1.7.0_71/bin/java 1
sudo alternatives --install /usr/bin/javac javac /opt/jdk1.7.0_71/bin/javac 1
sudo alternatives --install /usr/bin/jar jar /opt/jdk1.7.0_71/bin/jar 1


java -version
# Using alternatives
sudo alternatives --config java

#Using Environment Variables
export JAVA_HOME=/opt/jdk1.7.0_71
sudo sh -c "echo export JAVA_HOME=/opt/jdk1.7.0_71 >> /etc/environment"


# References:http://www.if-not-true-then-false.com/2010/install-sun-oracle-java-jdk-jre-7-on-fedora-centos-red-hat-rhel/
##  Install tomcat7 
#sudo yum install tomcat7-webapps tomcat7-docs-webapp tomcat7-admin-webapps
#sudo service tomcat7 start  
#sudo chkconfig tomcat7 on  
#sudo service tomcat7 restart  

sudo yum install tomcat-webapps tomcat-docs-webapp tomcat-admin-webapps -y
sudo service tomcat start  
sudo chkconfig tomcat on  
sudo service tomcat restart  
#systemctl start tomcat.service
