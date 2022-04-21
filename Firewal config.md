**Install UFW**
```bash
sudo apt install ufw
```
to check status
```bash
systemctl status ufw
```
**Config Default UFW rules**
```bash
ufw default allow outgoing
```
or
```bash
ufw default deny outgoing
```
**enable SSh with UFW**
```bash
ufw allow ssh or 22
```
**Enable UFW**
```bash
ufw enable
```
and check
```bash
usw status
```
**Allow other Ports**
```bash
ufw allow httq or 80
```
```bash
ufw allow https or 443
```
**Allow specific IP**
```bash
ufw allow from 127.0.1.1 to any port 22 proto tcp
```
**delete Ip Permission**
```bash
ufw status numbered
```
and 

```bash
ufw delete (specific no in row)
```
```bash
sudo ufw status
```

**BASIC IP TABLES COMMAND**


