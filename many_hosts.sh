#!/bin/bash
HOME=/root/scripts
FILE_L=`wc -l data.kopia | awk '{print $1}'`

for ((i=1; i<=$FILE_L; i++))
do   

IP=`sed -n "${i}p" data.kopia | awk '{print $1}'`
NAME=`sed -n "${i}p" data.kopia | awk '{print $2}'`

echo -e "\033[01;32mserwer ${NAME} $IP\033[00m..."
ssh -p 222 -o StrictHostKeyChecking=no root@${IP} "curl ipinfo.io" | grep ip.:
#rsync -av -e "ssh -p 222" authorized_keys root@${IP}:/root/.ssh/authorized_keys

#ssh -o StrictHostKeyChecking=no root@${IP} umount /boot
done
