#!/bin/bash
HOME=/home/mediabox/
sed -i 's/\r//g' ${HOME}variables.txt
source ${HOME}variables.txt
for x in $(grep group ${HOME}variables.txt); do z=`echo -n $x| tail -c 1`; if [ "$z" != "/" ]; then echo "Please check the last '/' in the variables.txt"; exit 1; fi;done

#cp ${HOME}schedul.txt ${HOME}schedul.bkp

#pobieramy scheduler
rsync -av --password-file=/etc/config/rsync_passwd rsync://root@${SERVER}${SCHEDULER} /home/mediabox/ > ${HOME}log/log
if [[ $? -ne 0 ]]; then 
SERVER=$SERVER_SLAVE
rsync -av --password-file=/etc/config/rsync_passwd rsync://root@${SERVER}${SCHEDULER} /home/mediabox/ > ${HOME}log/log
	if [[ $? -ne 0 ]]; then echo "please, check the variables.txt"; exit 1; fi
fi

#if grep -q schedul ${HOME}log; then
awk -F "/" '/Play=/ {print $3}' ${HOME}schedul.txt | sort -u | sed 's/\r//' > ${HOME}spots

#pobieramy muzykę
rsync -av --info=progress2 --password-file=/etc/config/rsync_passwd --files-from=${HOME}spots rsync://root@${SERVER}${SPOTY} /play/s/ >> ${HOME}log/`date +%y_%m_%d`.log
#if [[ $? -ne 0 ]]; then mv ${HOME}schedul.bkp ${HOME}schedul.txt; exit 1; fi
#fi
