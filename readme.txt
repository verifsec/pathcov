"Try .so fuzzing and mesure code coverage!"

Build
# make
# echo a | LD_LIBRARY_PATH=./ ./hello
# make clean

AFL
# make libpathcov.so fuzzer CC=afl-gcc
# LD_LIBRARY_PATH=./ afl-fuzz -m none -i ./fuzz/in -o ./out -- ./fuzz/fuzzer

AFL@Docker
# docker build -t fz:1 .
# docker run -itd --privileged --name fz fz:1
# docker exec -it fz echo core >/proc/sys/kernel/core_pattern
# docker exec -it fz /bin/bash -c "echo performance | tee cpu*/cpufreq/scaling_governor"
# docker exec -it fz /root/AFL/afl-fuzz -m none -i /root/pathcov/fuzz/in -o /root/out -- /root/pathcov/fuzz/fuzzer
# docker cp fz:/root/out .

Libfuzzer
# make libpathcov.so fuzzer0 CC=clang
# LD_LIBRARY_PATH=./ ./fuzzer0 >/dev/null -max_total_time=30 -print_final_stats=1

Libfuzzer@Docker
# docker build -t fz:0 .

/verifsec
