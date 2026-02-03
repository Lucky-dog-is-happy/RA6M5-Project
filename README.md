# Build And Flash

## On Linux
1. export ARM_TOOLCHAIN_PATH=/usr/sbin
2. cmake -DCMAKE_TOOLCHAIN_FILE=cmake/gcc.cmake -DCMAKE_BUILD_TYPE=Debug -G Ninja -B build/Debug
3. cmake --build build/Debug/
4. rfp-cli -device RA -port /dev/ttyACM0 -auto -file build/Debug/UART.srec -run
5. picocom /dev/ttyUSB0 -b 115200
