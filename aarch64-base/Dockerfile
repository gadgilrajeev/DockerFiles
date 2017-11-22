FROM arm64v8/ubuntu  
MAINTAINER Rajeev Gadgil <rajeev.gadgil@cavium.com>
RUN apt update
RUN apt install -y --no-install-recommends build-essential 
RUN apt install -y --no-install-recommends libssl-dev libpcre3-dev bc 
RUN apt install -y --no-install-recommends wget git libgnutls-dev libev-dev libevent-dev curl ca-certificates
RUN wget ftp://socrates/shay/gcc7-t99.tar.gz
RUN tar -zxvf gcc7-t99.tar.gz -C /opt
RUN rm -rf gcc7-t99.tar.gz
