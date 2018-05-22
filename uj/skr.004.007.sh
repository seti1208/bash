#!/bin/bash
if [ $# -ne 3 ]
 then 
 echo "Podaj parametry $0 liczba1 znak liczba2"
 echo "Prosze używać apostrofy dla znaka mnożenia" 
else
echo "scale=2; $1$2$3" |bc
#echo "suma liczb $1 i $3 = `expr $1 $2 $3`"
fi


