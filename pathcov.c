#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
int hello(uint8_t* buf) {
	if (buf[0] == 'a') {
		if (buf[1] == 'b') {
			if(buf[2] == 'c') {
				printf("ABC\n");
				return 0;
			} else if (buf[2] == 'x') {
				printf("ABX\n");
				return 0;
			}
			printf("ABY\n");
			return 0;
		}
		printf("AXY\n");
		return 0;
	}
	printf("Hello\n");
	return 0;
}
