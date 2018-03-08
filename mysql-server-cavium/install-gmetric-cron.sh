#!/bin/bash
while :
do
	sleep 59
	sudo /usr/local/bin/gmetric-mysql.sh 2>&1
done
