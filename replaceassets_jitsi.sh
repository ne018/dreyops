#!/usr/bin/env bash
# author : drey
# update web design

sudo rm /usr/share/jitsi-meet/base.html
sudo rm /usr/share/jitsi-meet/body.html
sudo rm /usr/share/jitsi-meet/favicon.ico
sudo rm /usr/share/jitsi-meet/head.html
sudo rm /usr/share/jitsi-meet/index.html
sudo rm /usr/share/jitsi-meet/interface_config.js
sudo rm /usr/share/jitsi-meet/logging_config.js
sudo rm /usr/share/jitsi-meet/package-lock.json
sudo rm /usr/share/jitsi-meet/package.json
sudo rm /usr/share/jitsi-meet/plugin.head.html
sudo rm /usr/share/jitsi-meet/robots.txt
sudo rm /usr/share/jitsi-meet/title.html

sudo rm -r /usr/share/jitsi-meet/lang
sudo rm -r /usr/share/jitsi-meet/css
sudo rm -r /usr/share/jitsi-meet/fonts
sudo rm -r /usr/share/jitsi-meet/images
sudo rm -r /usr/share/jitsi-meet/libs
sudo rm -r /usr/share/jitsi-meet/static
sudo rm -r /usr/share/jitsi-meet/sounds
sudo rm -r /usr/share/jitsi-meet/connection_optimization


sudo cp base.html  /usr/share/jitsi-meet/base.html
sudo cp body.html  /usr/share/jitsi-meet/body.html
sudo cp favicon.ico  /usr/share/jitsi-meet/favicon.ico
sudo cp head.html  /usr/share/jitsi-meet/head.html
sudo cp index.html  /usr/share/jitsi-meet/index.html
sudo cp interface_config.js  /usr/share/jitsi-meet/interface_config.js
sudo cp logging_config.js  /usr/share/jitsi-meet/logging_config.js
sudo cp package-lock.json  /usr/share/jitsi-meet/package-lock.json
sudo cp package.json  /usr/share/jitsi-meet/package.json
sudo cp plugin.head.html  /usr/share/jitsi-meet/plugin.head.html
sudo cp robots.txt  /usr/share/jitsi-meet/robots.txt
sudo cp title.html  /usr/share/jitsi-meet/title.html

sudo cp -r lang /usr/share/jitsi-meet/lang
sudo cp -r css /usr/share/jitsi-meet/css
sudo cp -r fonts /usr/share/jitsi-meet/fonts
sudo cp -r images /usr/share/jitsi-meet/images
sudo cp -r libs /usr/share/jitsi-meet/libs
sudo cp -r static /usr/share/jitsi-meet/static
sudo cp -r sounds /usr/share/jitsi-meet/sounds
sudo cp -r connection_optimization /usr/share/jitsi-meet/connection_optimization
