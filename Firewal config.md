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

**Configure and install firewall iptables in Ubuntu**

install 
```bash
sudo apt-get install iptables
```
syntax


**sudo iptables [option] CHAIN_rule [-j target]**

**The following are some of the frequently used options of iptables:**

    --append, -A: It is used for adding any rule to the end of a chain.
    --check, -C: It looks for the rule that is matching with the requirements of a chain.
    --delete, -D: It removes the defined rule from the chain.
    --flush, -F: It removes every rule from a chain.
    --insert, -I: It is used for adding any rule to the chain at a specified position.
    --list, -L: This option is used for displaying every rule within a chain.
    --new-chain, -N: It makes a new chain.
    --verbose, -V: It displays more details if using this option.
    --delete-chain, -X: It deletes a given chain.


