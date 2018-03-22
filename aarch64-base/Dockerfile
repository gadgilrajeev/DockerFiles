FROM ubuntu:17.10  
MAINTAINER Rajeev Gadgil <rajeev.gadgil@cavium.com>
RUN apt update
RUN apt install -y --no-install-recommends build-essential 
RUN apt install -y --no-install-recommends libssl-dev libpcre3-dev bc 
RUN apt install -y --no-install-recommends wget git libev-dev libevent-dev curl ca-certificates
RUN git clone git://cagit1.caveonetworks.com/t99/soctools.git
RUN cd soctools/socmon && make
