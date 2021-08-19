FROM ubuntu:20.04
ENV PRJ_PATH ~/proj
ENV TARGET libpathcov.so fuzzer0
ENV EXEC_TIME 30
RUN apt update
RUN apt install -y git make clang
RUN git clone http://github.com/verifsec/pathcov.git $PRJ_PATH
RUN make -C $PRJ_PATH $TARGET CC=clang
ENV LD_LIBRARY_PATH $PRJ_PATH:$LD_LIBRARY_PATH
RUN $PRJ_PATH/fuzz/fuzzer0 >/dev/null -max_total_time=$EXEC_TIME -print_final_stats=1