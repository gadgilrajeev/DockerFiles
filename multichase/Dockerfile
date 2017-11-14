FROM benchtool-image 
MAINTAINER Rajeev Gadgil "rajeev.gadgil@cavium.com"

RUN git clone https://github.com/google/multichase.git 
RUN cd multichase && make -j
WORKDIR /benchmarktool
EXPOSE 22
COPY docker-entrypoint-multichase.sh /docker-entrypoint.sh
RUN sudo chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

