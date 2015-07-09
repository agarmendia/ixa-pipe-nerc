#!/bin/bash
MPORT=2101     			#Main Port
CPORT=2102				#Control Port

clear
IXAdaemon_ctrl --mainPort=$MPORT --ctrlPort=$CPORT java -jar target/ixa-pipe-nerc-1.5.2.jar tag -l=en -server -m nerc-models-1.5.0/es/es-clusters-conll02.bin 
STATE=$?
echo
echo $STATE

if [ $STATE == "1" ]; then
	echo "error"
	exit 1
fi

IXAdaemon_client < $1