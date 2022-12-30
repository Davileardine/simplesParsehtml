#!/bin/bash

echo "Searching domain: $1 " 
wget $1

grep href index.html | cut -d '/' -f 3 | grep '\.' | cut -d '"' -f 1 | grep -v "<l" > lista
rm index.html

echo -e "We found the following hosts: \n"

for url in $(cat lista)
do
	host $url | grep 'has address'
done
rm lista

echo -e '\n END OF THE SCAN'
echo '#####################################################'
