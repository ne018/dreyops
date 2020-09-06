#!/bin/bash
# author: dr3y
# NOTE: Verify all variables before execute it.
# IMPORTANT: Make sure your file script exist in EXECPATH

FILENAME=mpdaemon.service
EXECPATH="/var/www/html/receive.php > /dev/null"
EXECSRC=/usr/bin/php
DESCRIPTION="Mass Push Daemon"
USER=root
PIDFILE=/var/run/mpdaemon.pid


print_something(){
  tsp=`date +%T`
  echo "$tsp: $1"
}

print_something " starting up..."
sleep 1

DPATH=/etc/systemd/system/$FILENAME
#DPATH=/home/vagrant/$FILENAME

print_something "Unit..."
sleep 1

echo "[Unit]" >> $DPATH
echo "Description=$DESCRIPTION" >> $DPATH
echo "" >> $DPATH
sleep 2

print_something "Service..."

echo "[Service]" >> $DPATH
echo "User=$USER" >> $DPATH
echo "Type=simple" >> $DPATH
echo "TimeoutSec=0" >> $DPATH
echo "PIDFile=$PIDFILE" >> $DPATH
echo "ExecStart=$EXECSRC -f $EXECPATH" >> $DPATH
echo "KillMode=process" >> $DPATH
echo "" >> $DPATH
echo "Restart=on-failure" >> $DPATH
echo "RestartSec=42s" >> $DPATH
echo "" >> $DPATH

print_something "Install..."
sleep 2

echo "[Install]" >> $DPATH
echo "WantedBy=default.target" >> $DPATH


print_something "enabling your service..."
sudo systemctl enable $FILENAME

print_something "starting your service..."
sudo systemctl start $FILENAME

print_something "status showing up..."
sudo systemctl status $FILENAME
