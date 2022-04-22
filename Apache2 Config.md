## APACHE2 CONFIG

**Install Apache2**
```bash
sudo apt update
```
```bash
sudo apt install apache2
```
to **check status**

```bash
sudo systemctl status apache2
```
to **check IP** and place your web browser to check apache 2 running status

```bash
hostname -i
```
**Apache2 Managing Process**

```bash
sudo systemctl start apache2
```
```bash
sudo systemctl stop apache2
```
```bash
sudo systemctl restart apache2
```
```bash
sudo systemctl reload apache2
```
```bash
sudo systemctl enable apache2
```
```bash
sudo systemctl disable apache2
```
## virtual Host setting Up

Make Directory 

```bash
sudo mkdir /var/www/your_domain
```
change ownership 

```bash
sudo chown -R USER:USER /var/www/your_domain
```
change Permission

```bash
sudo chmod -R 755 /var/www/your_domain
```
create sample HTML file

```bash
sudo vim /var/www/your_domain/index.html
```
**edit HTML file then save and exit
/Var/www/ section complete**

## To Modify /etc/Apache2 Section

```bash
cd /etc/apache2/sites-available
```
copy the 000-default.conf file 

```bash
sudo cp 000-default.conf your_domain.conf
```
```bash
Sudo vim your-domain.conf
```
**change ServerAdmin webmaster@your_domain
    ServerName your_domain
    DocumentRoot /var/www/your_domain**
save and exit 

lets enable ur domain file

```bash
sudo a2ensite your_domain.conf
```
lets disable old conf file

```bash
sudo a2dissite 000-default.conf
```
now test any Errors

```bash
sudo apache2ctl configtest
```
output shown

**Syntex Ok**

then restart Apache2

```bash
sudo systemctl restart apache2
```
final step **set ur Hosts**

```bash
Sudo vim /etc/hosts
```
output shown below add ur domain in last row

**127.0.10.11       localhost
127.0.11.11       google.com
127.0.11.11       your domain name

**# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters**

complete suucefully launch ur site

#SSL Configuration


```bash
enable SSL
```

```bash
sudo a2enmod ssl
```
restart the server

```bash
sudo systemctl restart apache2
```
create ssl key using open ssl cmd**


```bash
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt
```
Configuring Apache to Use SSL


```bash
sudo vim /etc/apache2/sites-available/your_domain_or_ip.conf
```
**<VirtualHost *:443>
   SSLEngine on
   SSLCertificateFile /etc/ssl/certs/apache-selfsigned.crt
   SSLCertificateKeyFile /etc/ssl/private/apache-selfsigned.key
</VirtualHost>**

create folder

```bash
sudo mkdir /var/www/your_domain_or_ip
```
create new file

```bash
sudo nano /var/www/your_domain_or_ip/index.html
```
site check

```bash
sudo a2ensite your_domain_or_ip.conf
```
reload

```bash
sudo systemctl reload apache2
```
