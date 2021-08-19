/* hello.c */
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <stdint.h>

int hello(uint8_t* buf);

int LLVMFuzzerTestOneInput(uint8_t* data, size_t size) {
	uint8_t* buf = (uint8_t*)malloc(3);	
	if (read(data, buf, 3) < 1) {
		printf("Hum?\n");
	} else {	
		hello(buf);
	}
	free(buf);
	return 0;
}

