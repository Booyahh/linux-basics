## Docker Installation

```bash
#Remove Previous ocker Dinstallation
sudo apt-get remove docker docker-engine docker.io containerd runc
```
**_Docker Additional files Download_**

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

**_After installation give permission SUDO for Docker group_**

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
#reboot
```

