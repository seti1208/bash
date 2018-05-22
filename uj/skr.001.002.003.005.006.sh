#!/bin/bash
#skr.005, wyświetlający bieżącą datę, czas i katalog
echo -e "`date` \nbieżący katalog: $PWD"
#skr.001,002
if [ $# -lt 2 ]
 then 
 echo -e "\033[31mPodaj min 2 parametry: \033[32m$0 liczba1 liczba2\033[39m"
 exit 0
else
echo "suma liczb $1 i $2 = `expr $1 + $2`"
fi

max=$1
min=$1
for x in $@
 do
 ((x > max)) && max=$x
 ((x < min)) && min=$x
done
echo "maksimalna liczba: $max"
echo "minimalna liczba: $min"

#skr.003 Sumowanie cyfr w liczbie $1 - tak to zadanie zrozumiałam
echo "liczba parametrów = $#"
a=$1;sum=0;for i in $(seq 1 ${#a}); do sum=`expr $sum + ${a:$i-1:1}`;done
echo "Suma cyfr w 1 parametrze = $sum"

#skr.006 który cyfry podanych liczb wypisze w odwrotnej kolejności.
echo "$@ :esrever" |rev

