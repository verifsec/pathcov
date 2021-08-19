CC      = gcc
CXX     = g++
CFLAG   = -g #-fprofile-arcs -ftest-coverage -coverage
RM      = rm -rf

all: libpathcov.so hello fuzzer

libpathcov.so: pathcov.c
	$(CC) $(CFLAG) --shared -fPIC $^ -o $@

hello: hello.c
	$(CC) $(CFLAG) -o $@ $^ -L./ -lpathcov

fuzzer: hello.c
	$(CC) $(CFLAG) -o ./fuzz/$@ $^ -L./ -lpathcov

fuzzer0: fuzz/fuzzer0.c
	$(CC) $(CFLAG) -o ./fuzz/$@ $^ -L./ -lpathcov
	
clean: libpathcov.so hello ./fuzz/fuzzer*
	$(RM) $^
	$(RM) *.gc*
