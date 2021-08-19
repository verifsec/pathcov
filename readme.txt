"Try fuzzing and mesure code coverage!"

Build
# make
# echo a | LD_LIBRARY_PATH=./ ./hello
# make clean

AFL
# make libpathcov.so fuzzer CC=afl-gcc
# LD_LIBRARY_PATH=./ afl-fuzz -m none -i ./fuzz/in -o ./out -- ./fuzz/fuzzer

AFL@Docker
# docker build -t sample:1 .
# docker run -itd --name sample sample:1
# docker exec -it sample /opt/AFL/afl-fuzz -m none -i /root/proj/fuzz/in -o ./out -- /root/proj/fuzz/fuzzer
# docker cp sample:/out .

Libfuzzer
# make libpathcov.so fuzzer0 CC=clang
# LD_LIBRARY_PATH=./ ./fuzzer0 >/dev/null -max_total_time=30 -print_final_stats=1

Libfuzzer@Docker
# docker build -t sample:0 .

/verifsec
