CC      = gcc
CXX     = g++
CFLAG   = -g -Wall
LIBFUZZ = -fsanitize=address,fuzzer
LIBFUZZ+= -fsanitize-coverage=edge,indirect-calls,trace-cmp,trace-div,trace-gep
RM      = rm -rf

all: libpathcov.so hello

libpathcov.so: pathcov.c
	$(CC) $(CFLAG) --shared -fPIC $^ -o $@

hello: hello.c
	$(CC) $(CFLAG) -o $@ $^ -L./ -lpathcov

fuzzer: hello.c
	$(CC) $(CFLAG) -o ./fuzz/$@ $^ -L./ -lpathcov

fuzzer0: fuzz/fuzzer0.c
	$(CC) $(CFLAG) $(LIBFUZZ) -o ./fuzz/$@ $^ -L./ -lpathcov
	
clean: libpathcov.so hello ./fuzz/fuzzer ./fuzz/fuzzer0
	$(RM) $^
