FROM benchtool-image 
MAINTAINER Rajeev Gadgil "rajeev.gadgil@cavium.com"

RUN git clone https://github.com/akopytov/cavium-mysql 
RUN cd cavium-mysql && CFLAGS="-march=native -mstrict-align" CXXFLAGS="$CFLAGS" cmake -DBUILD_CONFIG=mysql_release\
 -DENABLE_DOWNLOADS=1 -DDOWNLOAD_BOOST=1 -DWITH_BOOST=/tmp/boost -DWITH_NUMA=on -DWITH_LSE=on && make -j
RUN git clone https://github.com/akopytov/sysbench
RUN cd sysbench && ./autogen.sh && ./configure && make -j && sudo make install
EXPOSE 3306
RUN sudo mkdir /var/run/sshd
RUN sudo apt install -y ganglia-monitor cron
RUN sudo sed -i "s/8649/8665/g" /etc/ganglia/gmond.conf
RUN sudo sed -i "s/name \= \"unspecified\"/name \= \"Docker Containers\"/g" /etc/ganglia/gmond.conf
RUN sudo sed -i "s/send_metadata_interval \= 0/send_metadata_interval \= 30/g" /etc/ganglia/gmond.conf
#RUN sudo /etc/init.d/ganglia-monitor start
WORKDIR /benchmarktool
EXPOSE 22
EXPOSE 8665
COPY gmetric-mysql.sh /usr/local/bin/gmetric-mysql.sh
ADD install-gmetric-cron.sh /home/rgadgil/install-gmetric-cron.sh
RUN sudo chmod 777 /home/rgadgil/install-gmetric-cron.sh
RUN touch /home/rgadgil/cron.log
COPY docker-entrypoint-sysbench-mysql.sh /docker-entrypoint.sh
RUN sudo chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
