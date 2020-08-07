#!/bin/bash

apt update && apt install -y gnupg2 curl wget
wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
echo "deb https://repos.influxdata.com/debian buster stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
apt update && apt install influxdb -y
systemctl enable --now influxdb
systemctl status influxdb

apt install telegraf -y
mv /etc/telegraf/telegraf.conf /etc/telegraf/telegraf.conf.original
vim /etc/telegraf/telegraf.conf

[global_tags]
[agent]
interval = "10s"
debug = false
hostname = "jitsi_host"
round_interval = true
flush_interval = "10s"
flush_jitter = "0s"
collection_jitter = "0s"
metric_batch_size = 1000
metric_buffer_limit = 10000
quiet = false
logfile = ""
omit_hostname = false

systemctl enable --now telegraf
systemctl status telegraf

vim /etc/telegraf/telegraf.d/jitsi.conf

[[inputs.http]]
name_override = "jitsi_stats"
urls = ["http://localhost:8080/colibri/stats"]
data_format = "json"
method = "GET"

[[outputs.influxdb]]
urls = ["http://localhost:8086"]
database = "jitsi"
timeout = "0s"
retention_policy = ""
username = "devsecops"
password = "visionteq-hackers-community"

vim /etc/jitsi/videobridge/config

JVB_OPTS="--apis=rest,xmpp"

vim /etc/jitsi/videobridge/sip-communicator.properties

org.jitsi.videobridge.ENABLE_STATISTICS=true
org.jitsi.videobridge.STATISTICS_TRANSPORT=muc,colibri

systemctl restart jitsi-videobridge2
systemctl restart influxdb
systemctl restart telegraf
systemctl status telegraf
systemctl status influxdb


curl -v http://127.0.0.1:8080/colibri/stats
