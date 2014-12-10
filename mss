#!/bin/sh
#pass
SAVEDSTTY=`stty -g`
stty -echo
echo "Enter your password :"
read PASS
stty $SAVEDSTTY
mount -t cifs -o credentials=/root/actis //vs-fw35-customers.hq.actis.ru/d$ /media/custom
mount -t cifs -o credentials=/root/actis //vs-fw35-stage.hq.actis.ru/d$ /media/stage
mount -t cifs -o username="usysop",password=$PASS,domain="ACTIS-HC-1" //aspnet17204.hc.digillect.com/d$ /media/hosting
mount -t cifs -o username="usysop",password=$PASS,domain="ACTIS-HC-1" //aspnet17203.hc.digillect.com/d$ /media/ford
