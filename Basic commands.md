cd 

ls -a

ll

pwd

whoami
date
cp
vim
mkdir
rmdir
rm 
rm -f
apt update
apt install
apt remove
apt auto remove
apt purge
scp
ssh
ss -tlupn
netstat -tulpn
curl
grep
find
head
tail



```bash
global_defs {
  notification_email {
  }
  router_id LVS_DEVEL
  vrrp_skip_check_adv_addr
  vrrp_garp_interval 0
  vrrp_gna_interval 0
}
   
vrrp_script chk_haproxy {
  script "killall -0 haproxy"
  interval 2
  weight 2
}
   
vrrp_instance haproxy-vip {
  state BACKUP
  priority 100
  interface eth0                       # Network card
  virtual_router_id 60
  advert_int 1
  authentication {
    auth_type PASS
    auth_pass 1111
  }
  unicast_src_ip 172.16.0.2      # The IP address of this machine
  unicast_peer {
    172.16.0.3                         # The IP address of peer machines
  }
   
  virtual_ipaddress {
    172.16.0.10/24                  # The VIP address
  }
   
  track_script {
    chk_haproxy
  }
}

```
