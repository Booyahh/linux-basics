## node 1

```bash
cat <<EOF >> /etc/hosts
    2  192.168.1.3 node1
    3  192.168.1.9 node2
    4  EOF
    5  hostnamectl set-hostname node1
    6  yum update -y
    7  # install packages like httpd, drbd, pcs
    8  rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
    9  rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
   10  yum install -y kmod-drbd84 drbd84-utils -y
   11  yum install pacemaker pcs psmisc policycoreutils-python httpd -y vim
   12  # disble the selinux
   13  setenforce 0
   14  # disable the firewalld
   15  systemctl stop firewalld
   16  systemctl disable firewalld
   17  # Enable the server status for httpd server
   18  cat <<EOF >> /etc/httpd/conf.d/status.conf
   19  <Location /server-status>
   20      SetHandler server-status
   21      Require local
   22  </Location>
   23  EOF
   24  cat <<EOF >>  /etc/drbd.d/clusterdb.res
   25  resource clusterdb {
   26    protocol C;
   27    handlers {
   28      pri-on-incon-degr "/usr/lib/drbd/notify-pri-on-incon-degr.sh; /usr/lib/drbd/notifyemergency-reboot.sh; echo b > /proc/sysrq-trigger ; reboot -f";
   29      pri-lost-after-sb "/usr/lib/drbd/notify-pri-lost-after-sb.sh; /usr/lib/drbd/notifyemergency-reboot.sh; echo b > /proc/sysrq-trigger; reboot -f";
   30      local-io-error "/usr/lib/drbd/notify-io-error.sh; /usr/lib/drbd/notify-emergencyshutdown.sh; echo o > /proc/sysrq-trigger ; halt -f";
   31      fence-peer "/usr/lib/drbd/crm-fence-peer.sh";
   32      split-brain "/usr/lib/drbd/notify-split-brain.sh admin@acme.com";
   33      out-of-sync "/usr/lib/drbd/notify-out-of-sync.sh admin@acme.com";
   34    }
   35    startup {
   36      degr-wfc-timeout 120; # 2 minutes.
   37      outdated-wfc-timeout 2; # 2 seconds.
   38    }
   39    disk {
   40      on-io-error detach;
   41    }
   42    net {
   43     cram-hmac-alg "sha1";
   44     shared-secret "clusterdb";
   45     after-sb-0pri disconnect;
   46     after-sb-1pri disconnect;
   47     after-sb-2pri disconnect;
   48     rr-conflict disconnect;
   49    }
   50    syncer {
   51      rate 150M;
   52      al-extents 257;
   53      on-no-data-accessible io-error;
   54    }
   55    on node1 {
   56      device /dev/drbd0;
   57      disk /dev/sdb;
   58      address 192.168.1.3:7788;
   59      flexible-meta-disk internal;
   60    }
   61   on node2 {
   62      device /dev/drbd0;
   63      disk /dev/sdb;
   64      address 192.168.1.9:7788;
   65      meta-disk internal;
   66    }
   67  }
   68  EOF
   69  drbdadm create-md clusterdb
   70  drbdadm up clusterdb
   71  systemctl start drbd
   72  systemctl enable drbd
   73  systemctl status drbd
   74  drbdadm -- --overwrite-data-of-peer primary clusterdb
   75   cat /proc/drbd
   76  mkdir /drbd-webdata
   77  mkdir /drbd-dbdata
   78  vim /etc/lvm/lvm.conf
   79  lvmconf --enable-halvm --services --startstopservices
   80  dracut -H -f /boot/initramfs-$(uname -r).img $(uname -r)
   81  reboot
   82  setenforce 0
   83  cat /proc/drbd
   84  systemctl start pcsd.service
   85  systemctl enable pcsd.service
   86  passwd hacluster
   87  # assume that this is node1
   88  drbdadm primary --force clusterdb
   89  drbdadm -- --overwrite-data-of-peer primary clusterdb
   90  drbdadm up clusterdb
   91  systemctl start drbd
   92  drbdadm -- --overwrite-data-of-peer primary clusterdb
   93  drbdadm primary --force clusterdb
   94   cat /proc/drbd
   95  pvcreate /dev/drbd0
   96  vgcreate drbd-vg /dev/drbd0
   97  lvcreate --name drbd-webdata --size 2G drbd-vg
   98  lvcreate --name drbd-dbdata --size 2G drbd-vg
   99  mkfs.xfs /dev/drbd-vg/drbd-webdata
  100  mkfs.xfs /dev/drbd-vg/drbd-dbdata
  101  lsblk
  102  pcs cluster auth node1 node2 -u hacluster -p .
  103  pcs cluster setup --name fourtimes node1 node2
  104  pcs cluster start --all
  105  pcs cluster enable --all
  106  pcs property set stonith-enabled=false
  107  pcs property set no-quorum-policy=ignore
  108  pcs status
  109  pcs property set default-resource-stickiness=200
  110  pcs property set no-quorum-policy=ignore
  111  pcs cluster cib drbd_cfg
  112  pcs -f drbd_cfg resource create drbd_clusterdb ocf:linbit:drbd drbd_resource=clusterdb
  113  pcs -f drbd_cfg resource master drbd_clusterdb_clone drbd_clusterdb master-max=1 master-node-max=1 clone-max=2 clone-node-max=1 notify=true
  114  pcs status
  115  pcs cluster cib-push drbd_cfg
  116  pcs resource create lvm ocf:heartbeat:LVM volgrpname=drbd-vg
  117  pcs resource create webdata Filesystem device="/dev/drbd-vg/drbd-webdata" directory="/drbd-webdata" fstype="xfs"
  118  pcs resource create dbdata Filesystem device="/dev/drbd-vg/drbd-dbdata" directory="/drbd-dbdata" fstype="xfs"
  119  pcs resource create webserver ocf:heartbeat:apache configfile=/etc/httpd/conf/httpd.conf statusurl="http://localhost/server-status"
  120  pcs status
  121  drbdadm status
  122  cat /proc/drbd
  123  lsblk
  124  pcs resource group add resourcegroup lvm webdata dbdata  webserver
  125  pcs status
  126  lsblk
  127  pcs constraint order promote drbd_clusterdb_clone then start resourcegroup  # INFINITY
  128  pcs constraint colocation add resourcegroup  with master drbd_clusterdb_clone INFINITY
  129  pcs status
  130  drbdadm status
  131  cat /proc/drbd
  132  pcs status
  133  lsblk
  134  sudo  pcs cluster stop --all
  135  lsblk
  136  pcs status
  137  systemctl status stop drbd
  138  systemctl stop drbd
  139  systemctl status drbd
```

##node 2

```bash
cat <<EOF >> /etc/hosts
    2  192.168.1.3 node1
    3  192.168.1.9 node2
    4  EOF
    5  hostnamectl set-hostname node2
    6  yum install mysql-server
    7  yum update -y
    8  # install packages like httpd, drbd, pcs
    9  rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
   10  rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
   11  yum install -y kmod-drbd84 drbd84-utils -y
   12  yum install pacemaker pcs psmisc policycoreutils-python httpd -y vim
   13  # disble the selinux
   14  setenforce 0
   15  # disable the firewalld
   16  systemctl stop firewalld
   17  systemctl disable firewalld
   18  # Enable the server status for httpd server
   19  cat <<EOF >> /etc/httpd/conf.d/status.conf
   20  <Location /server-status>
   21      SetHandler server-status
   22      Require local
   23  </Location>
   24  EOF
   25  cat <<EOF >>  /etc/drbd.d/clusterdb.res
   26  resource clusterdb {
   27    protocol C;
   28    handlers {
   29      pri-on-incon-degr "/usr/lib/drbd/notify-pri-on-incon-degr.sh; /usr/lib/drbd/notifyemergency-reboot.sh; echo b > /proc/sysrq-trigger ; reboot -f";
   30      pri-lost-after-sb "/usr/lib/drbd/notify-pri-lost-after-sb.sh; /usr/lib/drbd/notifyemergency-reboot.sh; echo b > /proc/sysrq-trigger; reboot -f";
   31      local-io-error "/usr/lib/drbd/notify-io-error.sh; /usr/lib/drbd/notify-emergencyshutdown.sh; echo o > /proc/sysrq-trigger ; halt -f";
   32      fence-peer "/usr/lib/drbd/crm-fence-peer.sh";
   33      split-brain "/usr/lib/drbd/notify-split-brain.sh admin@acme.com";
   34      out-of-sync "/usr/lib/drbd/notify-out-of-sync.sh admin@acme.com";
   35    }
   36    startup {
   37      degr-wfc-timeout 120; # 2 minutes.
   38      outdated-wfc-timeout 2; # 2 seconds.
   39    }
   40    disk {
   41      on-io-error detach;
   42    }
   43    net {
   44     cram-hmac-alg "sha1";
   45     shared-secret "clusterdb";
   46     after-sb-0pri disconnect;
   47     after-sb-1pri disconnect;
   48     after-sb-2pri disconnect;
   49     rr-conflict disconnect;
   50    }
   51    syncer {
   52      rate 150M;
   53      al-extents 257;
   54      on-no-data-accessible io-error;
   55    }
   56    on node1 {
   57      device /dev/drbd0;
   58      disk /dev/sdb;
   59      address 192.168.1.3:7788;
   60      flexible-meta-disk internal;
   61    }
   62   on node2 {
   63      device /dev/drbd0;
   64      disk /dev/sdb;
   65      address 192.168.1.9:7788;
   66      meta-disk internal;
   67    }
   68  }
   69  EOF
   70  drbdadm create-md clusterdb
   71  drbdadm up clusterdb
   72  systemctl start drbd
   73  systemctl enable drbd
   74  systemctl status drbd
   75   cat /proc/drbd
   76  mkdir /drbd-webdata
   77  mkdir /drbd-dbdata
   78  vim /etc/lvm/lvm.conf
   79  lvmconf --enable-halvm --services --startstopservices
   80  dracut -H -f /boot/initramfs-$(uname -r).img $(uname -r)
   81  reboot
   82  setenforce 0
   83  cat /proc/drbd
   84  systemctl start pcsd.service
   85  systemctl enable pcsd.service
   86  passwd hacluster
   87  drbdadm up clusterdb
   88  systemctl start drbd
   89   cat /proc/drbd
   90  drbdadm up clusterdb
   91  systemctl start drbd
   92   cat /proc/drbd
   93  lsblk
   94  pcs status
   95  cd /etc/httpd/conf.
   96  cd /etc/httpd/conf.d/
   97  ll
   98  cat status.conf 
   99  cd
  100  drbdadm status
  101  cat /proc/drbd
  102  pcs status
  103  lsblk
  104  drbdadm status
  105  cat /proc/drbd
  106  lsblk
  107  pcs status
  108  systemctl stop drbd
  109  systemctl status drbd
```

