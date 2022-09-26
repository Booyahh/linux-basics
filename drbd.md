ls -l /dev/sdb1
sudo apt update

node1
sudo apt install ntp -y
sntp --version
sudo vim /etc/ntp.conf
```bash
   server 0.in.pool.ntp.org
	   server 1.in.pool.ntp.org
	   server 2.in.pool.ntp.org
	   server 3.in.pool.ntp.org
```
enter host entry on server side
node1
sudo vi /etc/hosts
```bash
192.168.1.100  NTP-server-host
```

node2 sync side

sudo ntpdate NTP-server-host
sudo timedatectl set-ntp off
sudo apt-get install ntp
