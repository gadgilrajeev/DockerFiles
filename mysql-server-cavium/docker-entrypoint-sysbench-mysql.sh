#!/bin/bash
echo ${1}
sudo /etc/init.d/ssh start
sudo /etc/init.d/ganglia-monitor restart
#sudo /etc/init.d/cron start
cp /benchmarktool/benchmarks/sysbench-mysql/config/mysqld.cnf_5 /opt/benchmarks/mysqld.cnf
sudo /home/rgadgil/install-gmetric-cron.sh &
cd /benchmarktool
python3 runme.py -w x86-ivy-cb1 -u rgadgil -s 127.0.0.1 -C sysbench-docker sysbench-mysql --mysqlddir /home/rgadgil/cavium-mysql/sql --mysqldir /home/rgadgil/cavium-mysql/client $1  

