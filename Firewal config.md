## Firewall configuration

 **What is Firewall?**

Firewall is a network security system that filters and controls the traffic on a predetermined set of rules. This is an intermediary system between the device and the internet.

**Chains?**

We have three chains(set of rules) which are used to process the traffic:-

    INPUT Chains => Any traffic coming from the internet(network) towards your local machine has to go through the input chains. 
    OUTPUT Chains => Any traffic going from your local machine to the internet needs to go through the output chains.
    FORWARD Chains => Any traffic which is coming from the external network and going to another network needs to go through the forward chain.
    
**Policies**

There are three actions which the iptables can perform on the traffic

    ACCEPT
    DROP
    REJECT

**Examine the case requirements**

|     SERVER      | 	   ACT AS  |	   IP ADDRESS   |   PACKAGES    |
|-----------------|-------------|------------------|----------------|
|    centos       |	server      |	192.168.0.2      |   server and client |
|    ubuntu       |	client      | 192.168.0.3      |   client & Gui |

**Server Installation**

if already is not installed,we must install the vsftpd package on server machine

```bash
sudo yum update -y
sudo yum install vsftpd -y
```

**Process flow** 
 
I have two users who must authenticate and upload flies to the ftp folder

* ftpuser1
* ftpuser2
 
**Modification of the configuration based on customization**

Once the Ftp packages have been installed,you can use this location to determine whether or not file exist.if the file exists,you must backup it before    making changes
  
 File location `/etc/vsftpd/vsftpd.conf`
 
 ```bash
# Based on this value you can insert or update the config file

anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
dirmessage_enable=YES
xferlog_enable=YES
xferlog_std_format=YES
ascii_upload_enable=YES
ascii_download_enable=YES
ftpd_banner=Welcome to Radiant FTP service.
listen=YES
listen_ipv6=NO
pam_service_name=vsftpd
userlist_enable=YES
tcp_wrappers=YES
use_localtime=YES
user_config_dir=/etc/vsftpd/users
allow_writeable_chroot=YES
```
  
 **Enable log file for Ftp**
 
The more important one is logging. When a user performs an operation, we can track it for auditing purposes. You cannot obtain audit information unless  you have a log.

add the some parameters in `vsftpd.conf` file

```bash
vsftpd_log_file=/var/log/vsftpd.log
```

 **Create user and userpassword**
 
 ```bash
 sudo useradd ftpuser1
 sudo passwd ftpuser1
 ```

 **Create a directory and assign it to 755 authentications**
 
 ```bash
mkdir /etc/vsftpd/users_list
mkdir /var/www/html/ftpuser1
chown ftpuser1:ftpuser1 /var/www/html/ftpuser1
 ```
 
**Enable the user list file**

```bash
vim /etc/vsftpd/users_list/keypass 
# add lines
local_root=/var/www/html/ftpuser1
```

**Restart the service**
 
 ```bash
 systemctl restart vsftpd
 systemctl enable vsftpd 
 ```
 

 
 ## **Firewall configuration**
 
 **Firwall whitelist**
 
 ```bash
 firewall-cmd --permanent --add-service=samba
 firewall-cmd --reload
```
**stop and disable the firewall**

```bash  
systemctl stop firewalld
systemctl disable firewalld
 ```
   
 **SELINUX configuration**
   
 CentOS will always enable selinux, so you must disable it.

 File location `/etc/selinux/conf`
     
 **Client Installation**
 
```bash
 sudo apt update
 sudo apt install ftp -y
```

**commandline uploads**


**Log file audit**

