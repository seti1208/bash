#!/bin/bash
#można dodać do cronu, albo uruchomić jak demon, ustawic do jakiego tty
#testowe parametry:
timeout=1
ile=7
terminal=/dev/pts/2
while [ $ile -gt 0 ]; do clear > $terminal;printf "\e[5;34m`date +%T`\e[39m" > $terminal ;ile=$[$ile-1]; sleep $timeout;done
#nie koniecznie jest użycie clear dla ilości powtórzeń = 0
