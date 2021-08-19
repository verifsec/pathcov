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
	
clean: libpathcov.so hello
	$(RM) $^
	$(RM) *.gc*
