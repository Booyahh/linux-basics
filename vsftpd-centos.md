##vsftpd 

```bash
# Based on this value you can insert or update the config file

anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
chroot_local_user=YES
dirmessage_enable=YES
user_sub_token=$USER
local_root=/var/www/html/ftpuser1/
xferlog_enable=YES
pasv_min_port=30000
pasv_max_port=31000
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
allow_writeable_chroot=NO
pasv_enable=YES
pasv_addr_resolve=YES
allow_writeable_chroot=YES
```
