/* hello.c */
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <stdint.h>

int hello(uint8_t* buf);

int LLVMFuzzerTestOneInput(uint8_t* data, size_t size) {
	if (size < 3) return 0;
	uint8_t* buf = (uint8_t*)malloc(3);	
	if (memcpy(buf, data, 3) < 1) {
		printf("Hum?\n");
	} else {	
		hello(buf);
	}
	free(buf);
	return 0;
}

