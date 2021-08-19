
Build
# make
# echo a | LD_LIBRARY_PATH=./ ./hello
# make clean

Fuzzing 
# make CC=afl-gcc
# LD_LIBRARY_PATH=./ afl-fuzz -m none -i ./fuzz/in -o ./out -- ./fuzz/fuzzer

Fuzzing @Docker
# docker build -t --no-cache sample:1 .
# docker run -itd --name sample sample:1
# docker exec -it sample /opt/AFL/afl-fuzz -m none -i /root/proj/fuzz/in -o ./out -- /root/proj/fuzz/fuzzer
# docker cp sample:/out .
# docker stop sample
# docker rm sample
# docker image rm -f 79f8dab123f5
