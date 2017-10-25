FROM ubuntu
MAINTAINER Shay Gal-On <sgalon@cavium.com>
RUN apt update
RUN apt install -y --no-install-recommends build-essential 
RUN apt install -y --no-install-recommends libssl-dev libpcre3-dev 
RUN apt install -y --no-install-recommends wget git libgnutls-dev libev-dev libevent-dev curl ca-certificates
