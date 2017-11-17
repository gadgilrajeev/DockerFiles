#!/bin/bash
echo ${1}
sudo /etc/init.d/ssh start
cd /benchmarktool
python3 runme.py -w x86-ivy-cb1 -u rgadgil -s 127.0.0.1 -C specint2017-docker specint $1
