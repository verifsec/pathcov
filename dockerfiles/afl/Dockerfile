FROM ubuntu:20.04
WORKDIR /root/
ENV TARGET libpathcov.so fuzzer
RUN apt update
RUN apt install -y git gcc make
RUN git clone https://github.com/google/AFL.git
RUN sed -i -e 's/O3/O3 -DSIMPLE_FILES/g' ./AFL/Makefile
RUN make -C ./AFL
RUN git clone https://github.com/verifsec/pathcov.git
WORKDIR pathcov
RUN make $TARGET CC=../AFL/afl-gcc
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:./
RUN cat ./fuzz/in/aaa | ./fuzz/fuzzer

