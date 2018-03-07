#!/bin/bash
echo ${1}
sudo /etc/init.d/ssh start
cd /benchmarktool
python3 runme.py -w x86-ivy-cb1 -u rgadgil -s 127.0.0.1 -C sysbench-docker sysbench-mysql --mysqlddir /home/rgadgil/cavium-mysql/sql --mysqldir /home/rgadgil/cavium-mysql/client $1
