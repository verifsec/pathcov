FROM ubuntu:20.04
ENV AFL_PATH /opt/AFL
ENV PRJ_PATH ~/proj
RUN apt update
RUN apt install -y git gcc make
RUN git clone https://github.com/google/AFL.git $AFL_PATH
RUN sed -i -e 's/O3/O3 -DSIMPLE_FILES/g' $AFL_PATH/Makefile
RUN make -C $AFL_PATH
RUN git clone http://github.com/verifsec/pathcov.git $PRJ_PATH
RUN make -C $PRJ_PATH CC=$AFL_PATH/afl-gcc
ENV LD_LIBRARY_PATH $PRJ_PATH:$LD_LIBRARY_PATH
RUN cat $PRJ_PATH/fuzz/in/aaa | $PRJ_PATH/fuzz/fuzzer