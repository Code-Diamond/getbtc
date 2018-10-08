#!/bin/bash
#Determine if curl is installed
dpkg -s curl > /dev/null

if ! [ $? -eq  0 ]; then
	sudo apt-get install curl	
fi

dpkg -s sysvbanner > /dev/null

if ! [ $? -eq  0 ]; then
	sudo apt-get install sysvbanner	
fi

#Assign scraped price to m
m=$(curl -sSL https://coinbase.com/api/v1/prices/historical | head -n 1 | sed "s|^.*,|$|" | sed "s|\(\.[0-9]$\)|\10|");

#clear terminal
tput clear;

#print bold
tput bold;

#print message
banner $m;

#turn bold off
tput sgr0;

#place prompt at bottom of screen
tput cup $( tput lines ) 0;