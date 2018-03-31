#!/bin/sh

if [ ! -d ~/.config/pulse/ ]; then 
     mkdir ~/.config/pulse/
fi

cd ~/.config/pulse/

cp /etc/pulse/default.pa ~/.config/pulse/
cp /etc/pulse/daemon.conf ~/.config/pulse/

sed -i -e "s/load-module-udev-detect .$/load-module-ude-detect tsched=0/g" default.pa
sed -i -e "s/; high/high/g" daemon.conf
sed -i -e "s/; realtime/realtime/g" daemon.conf
sed -i -e "s/default-fragments =.$/default-fragments = 1/g" daemon.conf
sed -i -e "s/default-fragment-size-msec =.$/default-fragment-size-msec = 1/g" daemon.conf
echo Done!
