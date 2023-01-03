## Docker Installation

```bash
#Remove any previous Docker installations.
sudo apt-get remove docker docker-engine docker.io containerd runc
```
**_Download additional Docker files_**

```bash
sudo apt-get install ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
```
**_Install Docker_**

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo systemctl start docker.service
sudo systemctl enable docker.service
```

**_After installation, grant SUDO permission to the Docker group._**

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
#reboot
```

**Uninstall Process**

```bash 
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
```
