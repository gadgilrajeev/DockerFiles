FROM arm64v8/ubuntu  
MAINTAINER Rajeev Gadgil <rajeev.gadgil@cavium.com>
RUN apt update
RUN apt install -y --no-install-recommends build-essential 
RUN apt install -y --no-install-recommends libssl-dev libpcre3-dev 
RUN apt install -y --no-install-recommends wget git libgnutls-dev libev-dev libevent-dev curl ca-certificates
RUN wget ftp://socrates/shay/gcc7.2.0.tgz
RUN tar -xvzf gcc7.2.0.tgz -C /opt
RUN rm -rf gcc7.2.0.tgz
