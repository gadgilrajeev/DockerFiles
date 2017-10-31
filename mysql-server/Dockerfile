FROM benchtool-image 
MAINTAINER Rajeev Gadgil "rajeev.gadgil@cavium.com"

RUN git clone https://github.com/mysql/mysql-server.git
RUN cd mysql-server && cmake -DBUILD_CONFIG=mysql_release -DDOWNLOAD_BOOST=1 -DWITH_BOOST=/tmp/boost \
      -DINSTALL_LAYOUT=STANDALONE -DCMAKE_INSTALL_PREFIX=/usr/local/mysql && make -j
RUN git clone https://github.com/akopytov/sysbench
RUN cd sysbench && ./autogen.sh && ./configure && make -j && sudo make install
EXPOSE 3306
RUN sudo mkdir /var/run/sshd
WORKDIR /benchmarktool
EXPOSE 22
COPY docker-entrypoint-sysbench-mysql.sh /docker-entrypoint.sh
RUN sudo chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

