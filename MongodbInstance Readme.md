sudo nano /etc/security/limits.conf
* soft nofile 64000
* hard nofile 64000
* soft nproc 32000
* hard nproc 32000

sudo nano /etc/security/limits.d/90-nproc.conf
* soft nproc 32000
* hard nproc 32000


System ULIMITS 

ulimit -a
ulimit  -n  21000
ulimit -u  192276



You can check the status of THP support by issuing the command
Before update THP check this command 
  cat  /sys/kernel/mm/transparent_hugepage/defrag
  [always] madvise never
  cat  /sys/kernel/mm/transparent_hugepage/enabled
  [always] madvise never
  
  echo never > /sys/kernel/mm/transparent_hugepage/defrag
  echo never > /sys/kernel/mm/transparent_hugepage/enabled


  cat  /sys/kernel/mm/transparent_hugepage/defrag
  always madvise [never]
  cat  /sys/kernel/mm/transparent_hugepage/enabled
  always madvise [never]
  
