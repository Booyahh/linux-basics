**Install UFW**
sudo apt install ufw

to check status
systemctl status ufw

**Config Default UFW rules**
ufw default allow outgoing
or
ufw default deny outgoing

**enable SSh with UFW**
ufw allow ssh or 22

**Enable UFW**
ufw enable

and check
usw status

**Allow other Ports**
ufw allow httq or 80

ufw allow https or 443

**Allow specific IP**
ufw allow from 127.0.1.1 to any port 22 proto tcp

**delete Ip Permission**
ufw status numbered

and 

ufw delete (specific no in row)
