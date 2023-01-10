    1  ip a
    2  ping 192.168.1.245
    3  sudo systemctl stop firewalld
    4  sudo systemctl disable firewalld
    5  vi /etc/selinux/config 
    6  setenforce 0
    7  ip a
    8  systemctl status network
    9  systemctl restart network
   10  ip a
   11  ssh -l admin 192.168.1.245
   12  yum update
   13  lsblk
   14  slsblk
   15  lsblk
   16  vim /etc/networks 
   17  yum install vim
   18  vim /etc/sysconfig/network-scripts/ifcfg-em1 
   19  vim /etc/sysconfig/network-scripts/ifcfg-em2
   20  ip a
   21  systemctl status network
   22  cat /var/log/messages 
   23  cat /var/log/messages  | grep network
   24  ifcfg em2
   25  ifcfg-em2
   26  ifcfg em2
   27  cd /etc/sysconfig/network-scripts/
   28  ls
   29  cd /etc/sysconfig/network-scripts/
   30  ll
   31  ifup ifcfg-em2
   32  ip a
   33  reboot
   34  ip a
   35  ifup ifcfg-em2
   36  ip a
   37  yum update
   38  df -Th
   39  cat /etc/sysconfig/network-scripts/ifcfg-em1
   40  cat /etc/sysconfig/network-scripts/ifcfg-em2
   41  vim /etc/sysconfig/network-scripts/ifcfg-em2
   42  ifdown ifcfg-em2
   43  ip a
   44  ifup ifcfg-em2
   45  ip a
   46  sudo hostnamectl set-hostname node-one
   47  reboot
   48  ip a
   49  sudo hostnamectl set-hostname dc-one-node-one
   50  hostname
   51  pwd
   52  yum update
   53  yum upgrade
   54  sudo syetemctl status firewalld
   55  sudo systemctl status firewalld
   56  setenforce 0
   57  cat <<EOF >> /etc/hosts
   58  192.168.1.181 dc-one-node-one
   59  192.168.1.184 dc-one-node-two
   60  EOF
   61  cat /etc/hosts
   62  reset
   63  pwd
   64  ping dc-one-node-one
   65  ping dc-one-node-two
   66  reste
   67  reset
   68  ip a
   69  vim script.sh
   70  bash script.sh 
   71  cat /etc/httpd/conf.d/status.conf
   72  lsblk
   73  fdisk /dev/sda 
   74  partprobe 
   75  lsblk
   76  cat /etc/hosts
   77  reset
   78  vim script.sh 
   79  vim drbd.sh
   80  reset
   81  bash drbd.sh 
   82  vim /etc/drbd.d/clusterdb.res
   83  reset
   84  drbdadm create-md clusterdb
   85  drbdadm up clusterdb
   86  systemctl start drbd
   87  systemctl enable drbd
   88  vim /etc/drbd.d/clusterdb.res
   89  reset
   90  drbdadm create-md clusterdb
   91  drbdadm up clusterdb
   92  systemctl start drbd
   93  systemctl enable drbd
   94  systemctl status drbd
   95  cat /proc/drbd
   96  reset
   97  drbdadm -- --overwrite-data-of-peer primary clusterdb
   98  history 
   99  systemctl status drbd
  100  cat /etc/drbd.d/clusterdb.res 
  101  reset
  102  drbdadm -- --overwrite-data-of-peer primary clusterdb
  103  lsblk
  104  modprobe drbd
  105  lsblk
  106  drbdadm -- --overwrite-data-of-peer primary clusterdb
  107  reset
  108  drbdadm up clusterdb
  109  drbdadm create-md clusterdb
  110  vim /etc/drbd.d/clusterdb.res 
  111  rm -rf /etc/drbd.d/clusterdb.res 
  112  reset
  113  cat <<EOF >>  /etc/drbd.d/clusterdb.res
  114  resource clusterdb {
  115    protocol C;
  116    handlers {
  117      pri-on-incon-degr "/usr/lib/drbd/notify-pri-on-incon-degr.sh; /usr/lib/drbd/notifyemergency-reboot.sh; echo b > /proc/sysrq-trigger ; reboot -f";
  118      pri-lost-after-sb "/usr/lib/drbd/notify-pri-lost-after-sb.sh; /usr/lib/drbd/notifyemergency-reboot.sh; echo b > /proc/sysrq-trigger; reboot -f";
  119      local-io-error "/usr/lib/drbd/notify-io-error.sh; /usr/lib/drbd/notify-emergencyshutdown.sh; echo o > /proc/sysrq-trigger ; halt -f";
  120      fence-peer "/usr/lib/drbd/crm-fence-peer.sh";
  121      split-brain "/usr/lib/drbd/notify-split-brain.sh admin@acme.com";
  122      out-of-sync "/usr/lib/drbd/notify-out-of-sync.sh admin@acme.com";
  123    }
  124    startup {
  125      degr-wfc-timeout 120; # 2 minutes.
  126      outdated-wfc-timeout 2; # 2 seconds.
  127    }
  128    disk {
  129      on-io-error detach;
  130    }
  131    net {
  132     cram-hmac-alg "sha1";
  133     shared-secret "clusterdb";
  134     after-sb-0pri disconnect;
  135     after-sb-1pri disconnect;
  136     after-sb-2pri disconnect;
  137     rr-conflict disconnect;
  138    }
  139    syncer {
  140      rate 150M;
  141      al-extents 257;
  142      on-no-data-accessible io-error;
  143    }
  144    on node1 {
  145      device /dev/drbd0;
  146      disk /dev/sda1;
  147      address 192.168.1.181:7788;
  148      flexible-meta-disk internal;
  149    }
  150   on node2 {
  151      device /dev/drbd0;
  152      disk /dev/sda1;
  153      address 192.168.1.184:7788;
  154      meta-disk internal;
  155    }
  156  }
  157  EOF
  158  rm -rf /etc/drbd.d/clusterdb.res 
  159  reset
  160  cat <<EOF >>  /etc/drbd.d/clusterdb.res
  161  resource clusterdb {
  162    protocol C;
  163    handlers {
  164      pri-on-incon-degr "/usr/lib/drbd/notify-pri-on-incon-degr.sh; /usr/lib/drbd/notifyemergency-reboot.sh; echo b > /proc/sysrq-trigger ; reboot -f";
  165      pri-lost-after-sb "/usr/lib/drbd/notify-pri-lost-after-sb.sh; /usr/lib/drbd/notifyemergency-reboot.sh; echo b > /proc/sysrq-trigger; reboot -f";
  166      local-io-error "/usr/lib/drbd/notify-io-error.sh; /usr/lib/drbd/notify-emergencyshutdown.sh; echo o > /proc/sysrq-trigger ; halt -f";
  167      fence-peer "/usr/lib/drbd/crm-fence-peer.sh";
  168      split-brain "/usr/lib/drbd/notify-split-brain.sh admin@acme.com";
  169      out-of-sync "/usr/lib/drbd/notify-out-of-sync.sh admin@acme.com";
  170    }
  171    startup {
  172      degr-wfc-timeout 120; # 2 minutes.
  173      outdated-wfc-timeout 2; # 2 seconds.
  174    }
  175    disk {
  176      on-io-error detach;
  177    }
  178    net {
  179     cram-hmac-alg "sha1";
  180     shared-secret "clusterdb";
  181     after-sb-0pri disconnect;
  182     after-sb-1pri disconnect;
  183     after-sb-2pri disconnect;
  184     rr-conflict disconnect;
  185    }
  186    syncer {
  187      rate 150M;
  188      al-extents 257;
  189      on-no-data-accessible io-error;
  190    }
  191    on dc-one-node-one {
  192      device /dev/drbd0;
  193      disk /dev/sda1;
  194      address 192.168.1.181:7788;
  195      flexible-meta-disk internal;
  196    }
  197   on dc-one-node-two {
  198      device /dev/drbd0;
  199      disk /dev/sda1;
  200      address 192.168.1.184:7788;
  201      meta-disk internal;
  202    }
  203  }
  204  EOF
  205  reset
  206  drbdadm create-md clusterdb
  207  drbdadm up clusterdb
  208  systemctl start drbd
  209  systemctl enable drbd
  210  systemctl status drbd
  211  reset
  212  drbdadm -- --overwrite-data-of-peer primary clusterdb
  213  catc /proc/drbd 
  214  cat /proc/drbd 
  215  watch cat /proc/drbd 
  216  lsblk
  217  top
  218  watch cat /proc/drbd 
  219  sudo -i
  220  watch cat /proc/drbd 
  221  mkdir /drbd-webdata
  222  mkdir /drbd-dbdata
  223  vim /etc/lvm/lvm.conf
  224  lvmconf --enable-halvm --services --startstopservices
  225  dracut -H -f /boot/initramfs-$(uname -r).img $(uname -r)
  226  reboot
  227  setenforce 0
  228  cat /proc/drbd
  229  systemctl start pcsd.service
  230  systemctl enable pcsd.service
  231  passwd hacluster
  232  cat /etc/passwd
  233  drbdadm primary --force clusterdb
  234  cat /proc/drbd
  235  pvcreate /dev/drbd0
  236  vgcreate drbd-vg /dev/drbd0
  237  lvcreate --name drbd-webdata --size 100G drbd-vg
  238  lvcreate --name drbd-dbdata --size 200G drbd-vg
  239  mkfs.xfs /dev/drbd-vg/drbd-webdata
  240  mkfs.xfs /dev/drbd-vg/drbd-dbdata
  241  pcs cluster auth dc-one-node-one dc-one-node-two -u hacluster -p .
  242  systemctl status pcs
  243  systemctl status pcsd
  244  pcs status
  245  cat /proc/drbd
  246  pcs cluster auth dc-one-node-one dc-one-node-two -u hacluster -p 
  247  pcs cluster auth dc-one-node-one dc-one-node-two -u hacluster
  248  pcs staus
  249  pcs status
  250  pcs cluster setup --name rcms-cluster dc-one-node-one dc-one-node-two
  251  pcs cluster setup --name rcms-cluster dc-one-node-one dc-one-node-two --force
  252  systemctl status firewaald
  253  systemctl status firewalld
  254  systemctl stop firewalld
  255  pcs cluster start --all
  256  pcs cluster enable --all
  257  pcs property set stonith-enabled=false
  258  pcs property set no-quorum-policy=ignore
  259  pcs status
  260  cat /var/log/messages
  261  pcs status
  262  history 
  263  pcs cluster cib drbd_cfg
  264  pcs -f drbd_cfg resource create drbd_clusterdb ocf:linbit:drbd drbd_resource=clusterdb
  265  pcs -f drbd_cfg resource master drbd_clusterdb_clone drbd_clusterdb master-max=1 master-node-max=1 clone-max=2 clone-node-max=1 notify=true
  266  pcs cluster cib-push drbd_cfg
  267  pcs resource create lvm ocf:heartbeat:LVM volgrpname=drbd-vg
  268  pcs resource create webdata Filesystem device="/dev/drbd-vg/drbd-webdata" directory="/drbd-webdata" fstype="xfs"
  269  pcs resource create dbdata Filesystem device="/dev/drbd-vg/drbd-dbdata" directory="/drbd-dbdata" fstype="xfs"
  270  pcs resource create virtualip ocf:heartbeat:IPaddr2 ip=192.168.1.180 cidr_netmask=24
  271  pcs status
  272  pcs cluster stop --all
  273  crm_verify -L
  274  pcs staus
  275  pcs status
  276  pcs cluster start --all
  277  pcs status
  278  drbdadm -- --overwrite-data-of-peer primary clusterdb
  279  pcs status
  280  pcs cluster stop --all
  281  pcs cluster start --all
  282  pcs status
  283  watch pcs status
  284  cat /proc/drbd
  285  drbdadm -- --overwrite-data-of-peer primary clusterdb
  286  cat /proc/drbd
  287  pcs status
  288  reboot
  289  cat /var/log/pcsd/pcsd.log 
  290  cat /var/log/pcsd/pcsd.log  | grep -i error
  291  cat /proc/drbd
  292  drbdadm secondary all
  293  drbdadm disconnect all
  294  drbdadm -- --discard-my-data connect all
  295  drbdadm status
  296  cat /proc/drbd
  297  systemctl stop httpd
  298  systemctl disable httpd
  299  pcs status
  300  pcs cluster start --all
  301  cat /proc/drbd
  302  watch cat /proc/drbd
  303  pcs status
  304  pcs cluster stop dc-one-node-one
  305  pvdisplay 
  306  lsblk
  307  pcs cluster start dc-one-node-one
  308  pcs status
  309  cat /proc/drbd 
  310  lsblk
  311  pvdisplay 
  312  cat /var/log/messages
  313  ip a
  314  pvcreate /dev/drbd0
  315  vgcreate drbd-vg /dev/drbd0
  316  lvcreate --name drbd-webdata --size 100G drbd-vg
  317  lvcreate --name drbd-dbdata --size 200G drbd-vg
  318  mkfs.xfs /dev/drbd-vg/drbd-webdata
  319  mkfs.xfs /dev/drbd-vg/drbd-dbdata
  320  pwd
  321  ls -la
  322  pwd
  323  ls -la
  324  pcs status
  325  pvdisplay 
  326  vgdisplay 
  327  lvdisplay 
  328  pcs cluster stop --all
  329  ifdown ifcfg-em2
  330  ip a
  331  pcs status
  332  lvdisplay 
  333  pcs status --debug
  334  cat /var/log/messages
  335  setenforce 0
  336  cat /var/log/messages
  337  cat /var/log/messages -f
  338  tail -f /var/log/messages 
  339  reboot
  340  pcs status
  341  df -Th
  342  pcs cluster auth dc-one-node-two -u hacluster
  343  pcs status
  344  pcs cluster setup --name rcms-cluster dc-one-node-one dc-one-node-two
  345  pcs cluster setup --name rcms-cluster dc-one-node-one dc-one-node-two --force
  346  pcs status
  347  pcs cluster start --all
  348  pcs cluster enable --all
  349  pcs property set stonith-enabled=false
  350  pcs property set no-quorum-policy=ignore
  351  pcs cluster cib drbd_cfg
  352  pcs destroy --all
  353  pcs cluster destroy --all
  354  cat  /proc/drbd
  355  systemctl start drbd
  356  cat  /proc/drbd
  357  renoot
  358  reboot
  359  cat /proc/drbd
  360  drbdadm -- --overwrite-data-of-peer primary clusterdb
  361  cat /proc/drbd
  362  lsblk
  363  lvdisplay 
  364  pcs cluster auth dc-one-node-one dc-one-node-two -u hacluster
  365  pcs cluster setup --name rcms-cluster dc-one-node-one dc-one-node-two --force
  366  pcs cluster start --all
  367  pcs cluster enable --all
  368  pcs property set stonith-enabled=false
  369  pcs property set no-quorum-policy=ignore
  370  pcs cluster cib drbd_cfg
  371  pcs -f drbd_cfg resource create drbd_clusterdb ocf:linbit:drbd drbd_resource=clusterdb
  372  pcs -f drbd_cfg resource master drbd_clusterdb_clone drbd_clusterdb master-max=1 master-node-max=1 clone-max=2 clone-node-max=1 notify=true
  373  pcs cluster cib-push drbd_cfg
  374  pcs resource create lvm ocf:heartbeat:LVM volgrpname=drbd-vg
  375  pcs resource create webdata Filesystem device="/dev/drbd-vg/drbd-webdata" directory="/drbd-webdata" fstype="xfs"
  376  pcs resource create dbdata Filesystem device="/dev/drbd-vg/drbd-dbdata" directory="/drbd-dbdata" fstype="xfs"
  377  pcs resource create virtualip ocf:heartbeat:IPaddr2 ip=192.168.1.180 cidr_netmask=24
  378  pcs resource create webserver ocf:heartbeat:apache configfile=/etc/httpd/conf/httpd.conf statusurl="http://localhost/server-status"
  379  pcs resource group add resourcegroup virtualip lvm webdata dbdata  webserver
  380  pcs constraint order promote drbd_clusterdb_clone then start resourcegroup
  381  pcs constraint colocation add resourcegroup  with master drbd_clusterdb_clone INFINITY
  382  pcs resource create ftpserver systemd:vsftpd --group resourcegroup
  383  pcs status
  384  pcs resource delete ftpserver 
  385  pcs status
  386  df -Th
  387  pcs status
  388  df -Th
  389  pcs status
  390  pcs cluster unstandby dc-one-node-one
  391  pcs status
  392  curl 192.168.1.180
  393  ip a
  394  ifdown ifcfg-em2
  395  curl 192.168.1.180
  396  df -Th
  397  vim /etc/sysconfig/network-scripts/ifcfg-em2
  398  cat /etc/sysconfig/network-scripts/ifcfg-em2
  399  systemctl restart network
  400  ip a
  401  pcs status
  402  ip a
  403  reboot
  404  pcs status
  405  reset
  406  pcs status
  407  df -Th
  408  lsblk
  409  yum install vsftpd -y
  410  systemctl start vsftpd.service
  411  systemctl enable vsftpd.service
  412  systemctl status vsftpd.service
  413  systemctl status firewalld
  414  setenforce 0
  415  cd /etc/vsftpd/
  416  ll
  417  vim vsftpd.conf 
  418  cp vsftpd.conf vsftpd.conf.back
  419  vim vsftpd.conf 
  420  vim /etc/vsftpd.userlist
  421  adduser datatx
  422  passwd datatx
  423  systemctl restart vsftpd
  424  cd /etc/httpd/conf/
  425  ll
  426  cp httpd.conf httpd.conf.back
  427  ll
  428  vim httpd.conf
  429  systemctl restart httpd
  430  systemctl status httpd.service
  431  lsblk
  432  vim httpd.conf
  433  pcs cluster stop --all
  434  pcs cluster start --all
  435  pcs status
  436  pcs cluster standby -- dc-one-node-one
  437  pcs cluster unstandby -- dc-one-node-one
  438  pcs status
  439  cd 
  440  cd /drbd-webdata/
  441  ll
  442  vim index.html
  443  ls -la
  444  curl localhost
  445  curl 192.168.1.180
  446  vim /etc/httpd/conf.d/welcome.conf 
  447  vim /etc/httpd/conf/httpd.conf
  448  pcs cluster stop --all
  449  pcs cluster start --all
  450  pcs status
  451  pcs cluster start --all
  452  pcs status
  453  ls -la
  454  rm -rf index.html 
  455  pcs status
  456  ls -la /drbd-
  457  ls -la /drbd-webdata/
  458  cat /drbd-webdata/index.html 
  459  curl localhost
  460  ls -la
  461  pcs status
  462  pwd
  463  curl -I localhost
  464  pwd
  465  cta /etc/vsftpd/vsftpd.conf
  466  cat /etc/vsftpd/vsftpd.conf
  467  pcs cluster status
  468  pcs status
  469  systemctl start vsftpd
  470  systemctl status vsftpd
  471  pcs status
  472  systemctl enable vsftpd
  473  lsblk
  474  df -Th
  475  vim /etc/vsftpd/vsftpd.conf
  476  cd
  477  vim /etc/vsftpd.userlist 
  478  systemctl restart vsftpd
  479  vim /etc/vsftpd/vsftpd.conf
  480  usermod -aG apache datatx
  481  systemctl restart vsftpd
  482  ll
  483  cd /
  484  ll
  485  chown apache:apache drbd-webdata
  486  chmod 775 drbd-webdata
  487  cd
  488  vim /etc/vsftpd/vsftpd.conf
  489  cd /etc/vsftpd
  490  ls -la
  491  systemctl restart vsftpd
  492  cd /drbd-webdata/
  493  ll
  494  pcs status
  495  vim /etc/httpd/conf/httpd.conf
  496  ssh -l root 192.168.1.184
  497  exit
  498  adduser rcms
  499  passwd rcms
  500  cat /etc/passwd
  501  visudo
  502  exit
  503  curl -I localhost
  504  exit
  505  df -Th
  506  httpd -V
  507  httpd -v
  508  ip a
  509  cat /etc/os-release 
  510  exit
  511  cat /var/log/mysqld.log 
  512  pcs status
  513  systemctl stop mysqld
  514  systemctl disable mysqld
  515  pcs status
  516  pcs resource delete dbserver
  517  pcs status
  518  sudo yum install mysql-server
  519  sudo yum install mysql-community-server
  520  sudo yum install mysql-community-server
  521  yum repolist all | grep mysql
  522  yum installmysql
  523  yum install mysql
  524  yum install https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-community-5.7.40-1.el7.src.rpm
  525  wget https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-community-5.7.40-1.el7.src.rpm
  526  yum install wget
  527  wget https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-community-5.7.40-1.el7.src.rpm
  528  yum localinstall mysql-community-5.7.40-1.el7.src.rpm 
  529  sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022 
  530  sudo yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm 
  531  sudo yum install mysql-community-server
  532  history 
  533  ssh root@192.168.1.184
  534  pcs status
  535  cp /etc/my.cnf /drbd-dbdata/my.cnf
  536  mkdir -p /drbd-dbdata/data
  537  vim /drbd-dbdata/my.cnf
  538  mysql_install_db --no-defaults --datadir=/drbd-dbdata/data
  539  mysqld --initialize --no-defaults --datadir=/drbd-dbdata/data
  540  mysql_install_db --no-defaults --datadir=/drbd-dbdata/data
  541  ls -al /drbd-dbdata/data/
  542  chown -R mysql:mysql /drbd-dbdata/
  543  pcs status
  544  pcs resource create dbserver ocf:heartbeat:mysql config="/drbd-dbdata/my.cnf" datadir="/drbd-dbdata/data" pid="/var/lib/mysql/mysql.pid" socket="/var/lib/mysql/mysql.sock" user="mysql" group="mysql" additional_parameters="--user=mysql" --group resourcegroup
  545  pcs status
  546  sudo ls /var/crash
  547  pcs status
  548  pcs resource create dbserver ocf:heartbeat:mysql config="/drbd-dbdata/my.cnf" datadir="/drbd-dbdata/data" pid="/var/lib/mysql/mysql.pid" socket="/var/lib/mysql/mysql.sock" user="mysql" group="mysql" additional_parameters="--user=mysql" --group resourcegroup
  549  pcs status
  550  yum install mysql
  551  yum install mysql*
  552  vim /etc/yum.repos.d/mysql-community-source.repo 
  553  mysql –h 192.168.0.200 –u root –p
  554  mysql -h 192.168.0.180
  555  mysql -h 192.168.1.180 -u root
  556  mysql -h 192.168.1.180 -u root -p
  557  ss -tulpn
  558  mysql_secure_installation 
  559  mysql -h 192.168.1.180 -u root -p8AA67zn44XpyVZ9b
  560  vim /drbd-dbdata/my.cnf 
  561  mysql -u root -p8AA67zn44XpyVZ9b
  562  mysql -u root -pPasswordChanged@123
  563  mysql -h 192.168.1.180 -u root -pPasswordChanged@123
  564  mysql -u root -pPasswordChanged@123
  565  mysql -u sqladmin -p9Qf2+kXrM@h9ZNhnL{Qnf
  566  pcs status
  567  pcs cluster standby dc-one-node-one
  568  vim script.sh 
  569  exit
  570  yum install -y httpd mod_ssl openssl php php-common php-mbstring php-xml     php-mysqlnd php-gd php-mcrypt php-pdo     php-curl php-cli php-opcache
  571  cat /var/log/httpd/access_log 
  572  cd /tmp/
  573  ls -la
  574  pwd
  575  pcs status
  576  pcs cluster unstandby dc-one-node-one
  577  pcs status
  578  top
  579  lsblk
  580  pwd
  581  pcs status
  582  pwd
  583  ssh monuser@192.168.5.251
  584  mysql -h 192.168.1.180 -u sqladmin -p
  585  top
  586  mysql -h 192.168.1.180 -u sqladmin -p
  587  cat script.sh 
  588  mysql -h 192.168.1.180 -u sqladmin -p
  589  ssh monuser@192.168.5.251
  590  top
  591  pwd
  592  mysql -h 192.168.1.180 -u sqladmin -p
  593  cat script.sh 
  594  mysql -h 192.168.1.180 -u sqladmin -p
  595  df -Th
  596  top
  597  cd /home/admin/
  598  ls -la
  599  gunzip < rcmsdata.gz | mysql -u sqladmin -p rcmsdata
  600  cat ~/script.sh 
  601  gunzip < rcmsdata.gz | mysql -u sqladmin -p rcmsdata
  602  gunzip < rcmsdata.gz | mysql -u root -p rcmsdata -v
  603  pcs status
  604  exit
  605  history
