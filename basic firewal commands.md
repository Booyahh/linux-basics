## Firewall Basics

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

**Basic UFW commands**

```bash
sudo ufw status
```

```bash
sudo ufw enable
```

```bash
sudo ufw disable
```

```bash
sudo ufw app list
```

```bash
sudo ufw deny from 203.0.113.100
```

**Bloc Subnet**

```bash
sudo ufw deny from 203.0.113.0/24
```

**Block Incoming Connections to a Network Interface**

```bash
sudo ufw deny in on eth0 from 203.0.113.100
```

**Block Outgoing SMTP Mail**

```bash
sudo ufw deny out 25
```
**Allow SSH**
```bash
sudo ufw allow OpenSSH
```
or 
```bash
sudo ufw allow 22
```
**Allow Incoming SSH from Specific IP Address or Subnet**
```bash
sudo ufw allow from 203.0.113.103 proto tcp to any port 22
```
using subnet address
```bash
sudo ufw allow from 203.0.113.0/24 proto tcp to any port 22
```
**Allow Incoming Rsync from Specific IP Address or Subnet**
```bash
sudo ufw allow from 203.0.113.103 to any port 873
```
or 
```bash
sudo ufw allow from 203.0.113.103/24 to any port 873
```
**Allow Nginx HTTP / HTTPS**

```bash
sudo ufw app list | grep Nginx
```
```bash
sudo ufw allow "Nginx Full"
```
To enable both HTTP and HTTPS traffic, choose Nginx Full. Otherwise, choose either Nginx HTTP to allow only HTTP or Nginx HTTPS to allow only HTTPS.

The following command will allow both HTTP and HTTPS traffic on the server (ports 80 and 443)

**Allow Apache HTTP / HTTPS**
```bash
sudo ufw app list | grep Apache
```
```bash
sudo ufw allow "Apache Full"
```
**Allow All Incoming HTTP and HTTPS (port 80,443)**
```bash
sudo ufw allow http or 80
```
```bash
sudo ufw allow https or 443
```
**Both in single rule**
```bash
sudo ufw allow proto tcp from any to any port 80,443
```
**Allow MySQL Connection from Specific IP Address or Subnet**
```bash
sudo ufw allow from 203.0.113.103 to any port 3306
```
**Allow PostgreSQL Connection from Specific IP Address or Subnet**
```bash
sudo ufw allow from 203.0.113.103 to any port 5432
```
subnet
```bash
sudo ufw allow from 203.0.113.103/24 to any port 5432
```

