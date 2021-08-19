a
?

FROM ubuntu:20.04
ENV AFL_PATH /opt/AFL
ENV PRJ_PATH ~/proj
RUN apt update
RUN apt install git build-essential
RUN git clone https://github.com/google/AFL.git $AFL_PATH
RUN sed -i -e 's/O3/O3 -DSIMPLE_FILES/g' $AFL_PATH/Makefile
RUN make -C $AFL_PATH
RUN git clone http://github.com/verifsec/pathcov.git $PRJ_PATH
RUN make -C $PRJ_PATH CC=$AFL_PATH/afl-gcc
RUN export LD_LIBRARY_PATH=$PRJ_PATH
RUN $AFL_PATH/afl-fuzz -m none -i $PRJ_PATH/fuzz/in -o ./out -- $PRJ_PATH/fuzz/fuzzer
