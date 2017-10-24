FROM ubuntu
MAINTAINER Rajeev Gadgil "rajeev.gadgil@cavium.com"

RUN \
  apt update && \
  apt -y upgrade && \
  apt install -y build-essential && \
  apt install -y software-properties-common && \
  apt install -y byobu curl git htop man unzip autoconf automake make libtool libssl-dev git libnuma-dev libaio-dev cmake python python3 wget libev-dev hdparm numactl libmysqlclient-dev\
 ipmitool lmbench bc libncurses5-dev bison pkg-config vim

RUN git clone https://github.com/mysql/mysql-server.git
RUN cd mysql-server && cmake -DBUILD_CONFIG=mysql_release -DDOWNLOAD_BOOST=1 -DWITH_BOOST=/tmp/boost \
      -DINSTALL_LAYOUT=STANDALONE -DCMAKE_INSTALL_PREFIX=/usr/local/mysql && make -j
RUN git clone https://github.com/akopytov/sysbench
RUN cd sysbench && ./autogen.sh && ./configure && make -j && make install
RUN git clone https://gadgilrajeev:Ncsu2306!@git.assembla.com/benchmarktool.git
