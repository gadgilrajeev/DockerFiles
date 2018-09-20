 FROM benchtool
 MAINTAINER Rajeev Gadgil "rajeev.gadgil@cavium.com"

 USER root
 RUN sudo mkdir -p BUILD_HPC
 RUN sudo mkdir -p BUILD_OPENMPI
 RUN sudo apt install -y zlib1g build-essential flex zlib1g-dev gcc-8 g++-8 gfortran-8
 RUN /bin/bash
 
 WORKDIR /root/
 RUN wget http://www.netlib.org/benchmark/hpl/hpl-2.2.tar.gz
 RUN tar -xzf hpl-2.2.tar.gz
 
 WORKDIR /root/BUILD_OPENMPI
 #RUN git clone https://github.com/open-mpi/ompi.git
 RUN wget https://download.open-mpi.org/release/open-mpi/v3.0/openmpi-3.0.2.tar.gz
 RUN tar -xzf openmpi-3.0.2.tar.gz  
 ENV CC="gcc-8" 
 ENV cXX="g++-8"
 ENV FC="gfortran-8"
 RUN cd openmpi-3.0.2 && ./configure --enable-mpi-cxx --with-cma --prefix=/root/hpl-2.2/usr && make -j && make install
 
 WORKDIR /root/BUILD_HPC
 RUN git clone https://github.com/xianyi/OpenBLAS.git
 RUN cd OpenBLAS && git checkout v0.2.20 && sed -i 's/tests\\ shared//g' Makefile && make -j 32 TARGET=THUNDERX2T99 NO_LAPACK=1 USE_THREAD=0

 WORKDIR /root/hpl-2.2
 COPY Make.THUNDERX2T99 /root/hpl-2.2/ 
 RUN sed -i 's/__HPL_SOURCE_ROOT__/\/root\/hpl-2.2/g' Make.THUNDERX2T99
 RUN sed -i 's/__MPI_INSTALL_DIR__/\/root\/hpl-2.2\/usr/g' Make.THUNDERX2T99
 RUN sed -i 's/__CC__/\/usr\/bin\/gcc-8/g' Make.THUNDERX2T99
 RUN sed -i 's/__LINKER__/gfortran-8/g' Make.THUNDERX2T99
 RUN sed -i 's/__BLAS_INSTALL_DIR__/\/root\/BUILD_HPC\/OpenBLAS/g' Make.THUNDERX2T99
 RUN sudo make arch=THUNDERX2T99
 RUN sudo make install arch=THUNDERX2T99
 RUN mkdir /var/run/sshd
 EXPOSE 22
 COPY HPL.dat /root/hpl-2.2 
 COPY run_hplinpack.sh /run_hplinpack.sh
 RUN chmod 777 /run_hplinpack.sh 
# USER rgadgil
 ENTRYPOINT ["/run_hplinpack.sh"]

