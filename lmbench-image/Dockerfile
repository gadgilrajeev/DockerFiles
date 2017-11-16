FROM benchtool-image 
MAINTAINER Rajeev Gadgil "rajeev.gadgil@cavium.com"

RUN wget https://sourceforge.net/projects/lmbench/files/latest/download/lmbench-3.0-a9.tgz  
RUN tar -xvzf lmbench-3.0-a9.tgz
RUN cd lmbench-3.0-a9 && make -j
RUN sudo mkdir /var/run/sshd
WORKDIR /benchmarktool
EXPOSE 22
COPY docker-entrypoint-lmbench.sh /docker-entrypoint.sh
RUN sudo chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
