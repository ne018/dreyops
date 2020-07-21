#!/usr/bin/env bash
# author : drey
# update web design

sudo rm -v /usr/share/jitsi-meet/base.html
sudo rm -v /usr/share/jitsi-meet/body.html
sudo rm -v /usr/share/jitsi-meet/favicon.ico
sudo rm -v /usr/share/jitsi-meet/head.html
sudo rm -v /usr/share/jitsi-meet/index.html
sudo rm -v /usr/share/jitsi-meet/interface_config.js
sudo rm -v /usr/share/jitsi-meet/logging_config.js
sudo rm -v /usr/share/jitsi-meet/package-lock.json
sudo rm -v /usr/share/jitsi-meet/package.json
sudo rm -v /usr/share/jitsi-meet/plugin.head.html
# sudo rm /usr/share/jitsi-meet/robots.txt
sudo rm -v /usr/share/jitsi-meet/title.html

sudo rm -rv /usr/share/jitsi-meet/lang
sudo rm -rv /usr/share/jitsi-meet/css
sudo rm -rv /usr/share/jitsi-meet/fonts
sudo rm -rv /usr/share/jitsi-meet/images
sudo rm -rv /usr/share/jitsi-meet/libs
sudo rm -rv /usr/share/jitsi-meet/static
sudo rm -rv /usr/share/jitsi-meet/sounds
sudo rm -rv /usr/share/jitsi-meet/connection_optimization


sudo cp -v base.html  /usr/share/jitsi-meet/base.html
sudo cp -v body.html  /usr/share/jitsi-meet/body.html
sudo cp -v favicon.ico  /usr/share/jitsi-meet/favicon.ico
sudo cp -v head.html  /usr/share/jitsi-meet/head.html
sudo cp -v index.html  /usr/share/jitsi-meet/index.html
sudo cp -v interface_config.js  /usr/share/jitsi-meet/interface_config.js
sudo cp -v logging_config.js  /usr/share/jitsi-meet/logging_config.js
sudo cp -v package-lock.json  /usr/share/jitsi-meet/package-lock.json
sudo cp -v package.json  /usr/share/jitsi-meet/package.json
sudo cp -v plugin.head.html  /usr/share/jitsi-meet/plugin.head.html
# sudo cp robots.txt  /usr/share/jitsi-meet/robots.txt
sudo cp -v title.html  /usr/share/jitsi-meet/title.html

sudo cp -rv lang /usr/share/jitsi-meet/lang
sudo cp -rv css /usr/share/jitsi-meet/css
sudo cp -rv fonts /usr/share/jitsi-meet/fonts
sudo cp -rv images /usr/share/jitsi-meet/images
sudo cp -rv libs /usr/share/jitsi-meet/libs
sudo cp -rv static /usr/share/jitsi-meet/static
sudo cp -rv sounds /usr/share/jitsi-meet/sounds
sudo cp -rv connection_optimization /usr/share/jitsi-meet/connection_optimization
