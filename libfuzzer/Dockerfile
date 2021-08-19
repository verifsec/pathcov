FROM ubuntu:20.04
WORKDIR /root/
ENV TARGET libpathcov.so fuzzer0
ENV EXEC_TIME 30
RUN apt update
RUN apt install -y git make clang
RUN git clone https://github.com/verifsec/pathcov.git
WORKDIR pathcov
RUN make $TARGET CC=clang
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:./
RUN ./fuzz/fuzzer0 >/dev/null -max_total_time=$EXEC_TIME -print_final_stats=1
