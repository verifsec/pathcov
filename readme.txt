"Try .so fuzzing and mesure code coverage!"

1. Build
# make
# echo a | LD_LIBRARY_PATH=./ ./hello
# make clean

2. AFL
# make libpathcov.so fuzzer CC=afl-gcc
# LD_LIBRARY_PATH=./ afl-fuzz -m none -i ./fuzz/in -o ./out -- ./fuzz/fuzzer

3. AFL@Docker
# docker build -t fz:1 .
# docker run -itd --privileged --name fz fz:1
# docker exec -it fz echo core >/proc/sys/kernel/core_pattern
# docker exec -it fz /bin/bash -c "echo performance | tee cpu*/cpufreq/scaling_governor"
# docker exec -it fz /root/AFL/afl-fuzz -m none -i /root/pathcov/fuzz/in -o /root/out -- /root/pathcov/fuzz/fuzzer
# docker cp fz:/root/out .

4. Libfuzzer
# make libpathcov.so fuzzer0 CC=clang
# LD_LIBRARY_PATH=./ ./fuzzer0 >/dev/null -max_total_time=30 -print_final_stats=1

5. Libfuzzer@Docker
# docker build -t fz:0 .

6. カバレッジ計測について
6.1 AFL
 ・前提
  - カレントディレクトリがpathcovディレクトリ
  - 検出したテストケースがout/queue/id*に格納されている
  - lcovをインストール済み
   $ sudo apt install lcov
 ・カバレッジ計測用にビルドし直すため、
   $ rm ./libpathcov.so
 ・makefileの3行目のコメントアウトを削除
   CFLAG    = -g -Wall -fprofile-arcs -ftest-coverage -coverage
 ・以下のようにビルドを実行
   $ make
 ・キュー内の全てのテストケースを実行
   $ for tc in ./out/queue/*; do cat $tc | LD_LIBRARY_PATH=./ ./hello; done
 ・LCOVでカバレッジ情報をHTMLとして出力
   $ lcov -c -d . -o cov.info
   $ genhtml -o cov cov.info
 ・Webブラウザで出力結果を確認
   $ firefox ./cov/index.html

6.2 Libfuzzer
 ・（検討中）

/verifsec
