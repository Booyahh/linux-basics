```bash
    1  sudo useradd --system --no-create-home --shell /usr/sbin/nologin prometheus
    2  wget https://github.com/prometheus/prometheus/releases/download/v2.28.0/prometheus-2.28.0.linux-amd64.tar.gz
    3  wget https://github.com/prometheus/prometheus/releases/download/v2.37.6/prometheus-2.37.6.linux-amd64.tar.gz
    4  cd /home/deva/
    5  ll
    6  cd
    7  ll
    8  tar xvzf prometheus-2.37.6.linux-amd64.tar.gz 
    9  ls -la
   10  sudo mv -v prometheus-2.28.0.linux-amd64 /opt/prometheus
   11  sudo mv -v prometheus-2.37.6.linux-amd64 /opt/prometheus
   12  cd /opt/prometheus/
   13  ll
   14  cd
   15  mv  prometheus-2.37.6.linux-amd64 /opt/prometheus
   16  ll
   17  sudo chown -Rfv root:root /opt/prometheus
   18  chmod -Rfv 0755 /opt/prometheus
   19  #nano /opt/prometheus/prometheus.yml
   20  vim /opt/prometheus/prometheus.yml
   21  mkdir -v /opt/prometheus/data
   22  chown -Rfv prometheus:prometheus /opt/prometheus/data
   23  #nano /etc/systemd/system/prometheus.service
   24  vim /etc/systemd/system/prometheus.service
   25  systemctl daemon-reload
   26  systemctl start prometheus.service 
   27  systemctl status prometheus.service 
   28  hostname -I
   29  wget https://github.com/prometheus/node_exporter/releases/download/v1.1.2/node_exporter-1.1.2.linux-amd64.tar.gz
   30  ll
   31  tar xzf node_exporter-1.1.2.linux-amd64.tar.gz 
   32  ll
   33  $ ls -lh node_exporter-1.1.2.linux-amd64
   34  ls -lh node_exporter-1.1.2.linux-amd64
   35  sudo mv -v node_exporter-1.1.2.linux-amd64/node_exporter /usr/local/bin
   36  sudo chown root:root /usr/local/bin/node_exporter
   37  node_exporter --version
   38  $ sudo nano /etc/systemd/system/node-exporter.service
   39  sudo vim /etc/systemd/system/node-exporter.service
   40  systemctl start node-exporter.service 
   41  systemctl status node-exporter.service 
   42  systemctl enable node-exporter.service
   43  systemctl enable prometheus.service 
   44  vi /opt/prometheus/prometheus.yml
   45  systemctl restart prometheus.service
   46  systemctl status prometheus.service
   47  apt-get update -y
   48  apt-get install wget curl gnupg2 apt-transport-https software-properties-common -y
   49  wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -
   50  echo "deb https://packages.grafana.com/oss/deb stable main" | tee -a /etc/apt/sources.list.d/grafana.list
   51  apt-get update -y
   52  apt-get install grafana -y
   53  systemctl start grafana-server
   54  systemctl enable grafana-server
   55  history

```
