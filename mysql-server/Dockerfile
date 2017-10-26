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
#CMD ["sudo", "/usr/sbin/sshd", "-D"]  

ENTRYPOINT ["python3","runme.py","-w","x86-ivy-cb1","-u","rgadgil","-s","127.0.0.1","sysbench-mysql"]
