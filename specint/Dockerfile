FROM benchtool-image 
MAINTAINER Rajeev Gadgil "rajeev.gadgil@cavium.com"

RUN sudo apt install ftp -y
RUN sudo mkdir /var/run/sshd
WORKDIR /benchmarktool
EXPOSE 22
COPY docker-entrypoint-specint.sh /docker-entrypoint.sh
RUN sudo chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

