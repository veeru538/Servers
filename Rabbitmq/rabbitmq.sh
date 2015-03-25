#!/bin/bash
wget http://ftp.riken.jp/Linux/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
# wget http://mirrors.ircam.fr/pub/fedora/epel/7/x86_64/e/epel-release-7-5.noarch.rpm 
# yum install  epel-release-7-5.noarch.rpm  -y
yum install epel-release-6-8.noarch.rpm -y
yum install erlang -y
rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.5.0/rabbitmq-server-3.5.0-1.noarch.rpm
yum install -y  yum install rabbitmq-server-3.5.0-1.noarch.rpm
service rabbitmq-server start
chkconfig rabbitmq-server on
rabbitmq-plugins enable rabbitmq_management
service rabbitmq-server restart

