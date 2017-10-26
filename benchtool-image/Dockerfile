FROM base 
MAINTAINER Rajeev Gadgil "rajeev.gadgil@cavium.com"

RUN \
  apt update && \
  apt -y upgrade && \
  apt install -y build-essential && \
  apt install -y software-properties-common && \
  apt install -y byobu curl git htop man unzip autoconf automake make libtool libssl-dev git libnuma-dev libaio-dev cmake python python3 wget libev-dev hdparm numactl libmysqlclient-dev\
 ipmitool lmbench bc libncurses5-dev bison pkg-config vim iputils-ping sysstat ssh openssh-server openssh-client sudo net-tools

RUN git clone https://github.com/gadgilrajeev/benchmarktool.git
EXPOSE 22
RUN sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers
RUN echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
RUN useradd -ms /bin/bash rgadgil && echo "rgadgil:rgadgil" | chpasswd && adduser rgadgil sudo
USER rgadgil
WORKDIR /home/rgadgil/
RUN ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N "" &&  cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN echo "|1|7AEOOIjrT5g2axyit5MfXKIfRiY=|Y0NylnCNScV+QIwqb3EU/oKS7Js= ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBNS/lJhdnB32lr64QCRMmjYDYTxWmILVdkpIDgqhWryV8K4uH2XIGFK+5Q4gPUS1KfZexxdWyvVfxj1shrpZ9hE=" >> ~/.ssh/known_hosts
RUN sudo mkdir /opt/benchmarks
RUN sudo chmod -R 777 /opt
