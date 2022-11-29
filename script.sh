```bash
yum update -y
# install packages like httpd, drbd, pcs
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
yum install -y kmod-drbd84 drbd84-utils -y
yum install pacemaker pcs psmisc policycoreutils-python httpd -y vim
# disble the selinux
setenforce 0
# disable the firewalld
systemctl stop firewalld
systemctl disable firewalld
# Enable the server status for httpd server
cat <<EOF >> /etc/httpd/conf.d/status.conf
<Location /server-status>
    SetHandler server-status
    Require local
</Location>
EOF
```
