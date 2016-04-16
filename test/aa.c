#include <windows.h>

#define UNICODE

// set s[eed to first value
int main(int argc, char **argv) {
    int speed = 0;


    printf("Set Mouse Speed by Maverick\n");

    if (argc == 1) return 0;
    if (argc >= 2) sscanf(argv[1], "%d", &speed1);

    SystemParametersInfo(SPI_SETMOUSESPEED, 0, speed, 0);

    return 0;
}
