#!/bin/bash
HOME=/home/mediabox/
sed -i 's/\r//g' ${HOME}variables.txt
source ${HOME}variables.txt
MUSIC_FILE=${HOME}music.txt
MONTH=`date +%y_%m`
MONTH_NEXT=`date -d '+1 month' +%y_%m`

#pobieramy scheduler
rsync -av --password-file=/etc/config/rsync_passwd rsync://root@${SERVER}${SCHEDULER} /home/mediabox/ 
if [[ $? -ne 0 ]]; then 
SERVER=$SERVER_SLAVE
rsync -av --password-file=/etc/config/rsync_passwd rsync://root@${SERVER}${SCHEDULER} /home/mediabox/ 
	if [[ $? -ne 0 ]]; then exit 1; fi
fi

cat ${HOME}schedul.txt | awk -F / '/Playlist/ {print $2}' | sed 's/\r//' > ${HOME}playlists

#pobieramy playlisty
rsync -av --password-file=/etc/config/rsync_passwd rsync://root@${SERVER}${PLAYLISTY}start.m3u /home/mediabox/
cat ${HOME}start.m3u | sort -u | awk -F "/" '{print $4}' | sed 's/\r//' > $MUSIC_FILE
rsync -av --password-file=/etc/config/rsync_passwd --files-from=${HOME}playlists rsync://root@${SERVER}${PLAYLISTY} /home/mediabox/ > ${HOME}log/`date +%y_%m_%d`.log 
if [ $? -eq 0 ] &&  grep -q M3U ${HOME}log/`date +%y_%m_%d`.log 
then
cat $HOME*$MONTH* $HOME*$MONTH_NEXT* | sort -u | awk -F "/" '{print $4}' | sed 's/\r//' >> $MUSIC_FILE

#pobieramy muzykę
rsync -av --password-file=/etc/config/rsync_passwd --files-from=$MUSIC_FILE rsync://root@${SERVER}/music/ /play/u/li/
fi

#czyszczenie
if [[ `date +%d` == 20 ]] 
then
for x in $(ls /play/u/li/);do if ! grep -q $x $MUSIC_FILE; then rm /play/u/li/$x;fi;done
cd ${HOME}
for x in $(ls *.M3U);do if ! grep -q $x schedul.txt ; then rm $x;fi;done
fi
