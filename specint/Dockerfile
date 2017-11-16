FROM benchtool-image 
MAINTAINER Rajeev Gadgil "rajeev.gadgil@cavium.com"

RUN wget ftp://socrates/shay/cpu2017-1.0.2.iso
RUN sudo apt-get install p7zip-full p7zip-rar
RUN 7z -ospec2017 x cpu2017-1.0.2.iso
RUN spec2017/install.sh -d /opt/cpu2017
#RUN sudo mount cpu2017-1.0.2.iso /mnt/
#RUN cd /mnt && ./install.sh -d /opt/cpu2017
#RUN sudo mkdir /var/run/sshd
WORKDIR /benchmarktool
EXPOSE 22
COPY docker-entrypoint-specint.sh /docker-entrypoint.sh
RUN sudo chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

