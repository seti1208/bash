#!/bin/bash
if [ $# -ne 3 ]; then
 echo "Podaj parametry: plik liczba1 liczba2"
else
plik=$1
f=$2 #od
l=$3 #do

if [ ! -f $plik ]; then echo "plik nie istnieje";exit 0;fi 

sed -ne "${f},${l}p" $plik
stat $plik
fi
