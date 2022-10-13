## Oracle Linux Server 7.9

```bash
sudo yum update -y
sudo yum install httpd -y
service firewalld stop
systemctl disable firewalld
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' 
sudo yum install php ( PHP 7.3.33 (cli) )( 
sudo yum install mysql-server -y ( mysql 5.7.40 )


```

