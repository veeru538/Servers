
Issues & Solutions:
==================
Before  install rabbitmq-server installing you must set updated hosts entry in /etc/hosts file


1) Issue: 
   ------
          prevent access using the default guest/guest credentials except via localhost. in log file
          
   Solution :
   ---------
       vi  /etc/rabbitmq/rabbitmq.config

      [{rabbit, [{loopback_users, []}]}].

      sudo rabbitmq-plugins enable rabbitmq_management

      sudo service rabbitmq-server restart

2) If you want create a new user with admin grants:

      sudo rabbitmqctl add_user test test
      sudo rabbitmqctl set_user_tags test administrator
      sudo rabbitmqctl set_permissions -p / test ".*" ".*" ".*"

3)  Rabbitmq cluster 
     sudo service rabbitmq-server stop
     
     vi /var/lib/rabbitmq/.erlang.cookie
     #copy value(text) and paste servers 2&3 cookie file

     sudo service rabbitmq-server start
     sudo rabbitmqctl stop_app
     sudo rabbitmqctl reset
     sudo rabbitmqctl start_app
     sudo rabbitmqctl cluster_status

server 2&3:
==========
     sudo service rabbitmq-server start

     sudo rabbitmqctl stop_app

     sudo rabbitmqctl reset

     #copy rabbitmq server1 node informatio and paste server2 & 3

     sudo rabbitmqctl join_cluster rabbit@ip-2
     sudo rabbitmqctl start_app
     sudo rabbitmqctl cluster_status
     sudo rabbitmq-plugins enable rabbitmq_management
     sudo service rabbitmq-server stop ; sudo service rabbitmq- server start
