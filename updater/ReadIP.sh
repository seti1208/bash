#!/bin/bash
hwclock --hctosys
sleep 2
DIR=/opt/play/IP/
IP=`ifconfig eth0 | awk '/inet / {print $2}'`
cd $DIR
for i in $(seq 1 ${#IP});do mpg123 ${IP:$i-1:1}.mp3;done 
USB=`lsblk | grep sda1`
DIR=/mnt/service
if [ "$USB" != "" ]; then
 mkdir -p $DIR
 echo " will be mounted on $DIR. "
 /bin/mount -o uid=0,gid=0 /dev/sda1 $DIR
 cd $DIR
 cd
fi 
#sudo /bin/umount $DIR
