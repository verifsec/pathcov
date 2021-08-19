/* fuzzer.c */
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <stdint.h>

int hello(uint8_t* buf);

int main() {
	uint8_t* buf = (uint8_t*)malloc(3);
	if (read(0, buf, 3) < 1) {
		printf("Hum?\n");
	} else {
		hello(buf);
	}
	free(buf);
	return 0;
}
