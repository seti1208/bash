#!/bin/bash
if [ $# -ne 1 ]
then
        echo "Usage : $0 number 1-9"
        exit
fi
powtorz_liczby() {
i=0;while [ $i -lt 5 ];do i=$[i+1]; eval printf "'$i'%.0s" {1..$i};echo;done
}

powtorz_symboly() {
i=0;while [ $i -lt 5 ];do i=$[i+1]; eval printf "'$1'%.0s" {1..$i};echo -e "\b$2" ;done
}

powtorz_symboly_desc() {
i=5;while [ $i -gt 0 ];do eval printf "'$1'%.0s" {1..$i};echo -e "\b$2";i=$[i-1];done
}

trojkat_liczbowy() {
i=1;j=9;while [ $i -le 9 ];do eval printf "' '%.s" {1..$j};eval printf "'$i '%.s" {1..$i};echo; i=$[i+1]; j=$[j-1];done
}

trojkat_symbolny() {
i=1;j=9;while [ $i -le 9 ];do eval printf "' '%.s" {1..$j};eval printf "'$1 '%.s" {1..$i};echo; i=$[i+1]; j=$[j-1];done
}

trojkat_symbolny_desc() {
i=9;j=1;while [ $i -gt 0 ];do eval printf "' '%.s" {1..$j};eval printf "'$1 '%.s" {1..$i};echo; i=$[i-1]; j=$[j+1];done
}

case "$1" in

1)  echo "obrazek #1"
    powtorz_liczby 
    ;;
2)  echo "obrazek #2"
    i=0;while [ $i -lt 5 ];do i=$[i+1];for x in `seq 1 $i`;do printf $x;done;echo;done
    ;;
3)  echo "obrazek #3"
    powtorz_symboly '| ' '_'	
    ;;
4)  echo "obrazek #4"
    powtorz_symboly '* '	
    ;;
5)  echo "obrazek #5"
    powtorz_symboly '* '	
    powtorz_symboly_desc '* '	
    ;;
6)  echo "obrazek #6"
    powtorz_symboly '###dziwna_ ' 'rzecz____>'	
    powtorz_symboly_desc '###dziwna_ ' 'rzecz____>'
    ;;
7)  echo "obrazek #7"
    trojkat_liczbowy
    ;;
8)  echo "obrazek #8"
    trojkat_symbolny '*'
    ;;
9)  echo "obrazek #9"
    trojkat_symbolny '*'
    trojkat_symbolny_desc '*'
    ;;
*) echo "Nie ma takiego numera"
   ;;
esac
