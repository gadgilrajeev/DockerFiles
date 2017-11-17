FROM benchtool-image 
MAINTAINER Rajeev Gadgil "rajeev.gadgil@cavium.com"

RUN wget ftp://socrates/shay/cpu2017-1.0.2.iso
RUN sudo apt install xorriso -y 
RUN xorriso -osirrox on -indev cpu2017-1.0.2.iso -extract / spec2017
RUN cd spec2017 && ./install.sh -d /opt/cpu2017 -f
RUN sudo rm cpu2017-1.0.2.iso
RUN sudo rm -rf spec2017
WORKDIR /benchmarktool
EXPOSE 22
COPY docker-entrypoint-specint.sh /docker-entrypoint.sh
RUN sudo chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
