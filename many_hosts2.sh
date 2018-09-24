#!/bin/bash

IP=11
IPE=32

until [ $IP -gt $IPE ];
do
echo -e "\e[32mstand 10.4.4.$IP\e[0m"
#rsync -av /root/update/ 10.4.4.$IP:/root/update/
#ssh 10.4.4.$IP "systemctl restart xinetd"
ssh 10.4.4.$IP df -h
#sshpass -p '123456' ssh 10.4.4.$IP lpq
let IP=IP+1
done
