# AGENTS.md - Developer Guide for RA6M5-Project

This document provides guidelines for agentic coding agents working on this codebase.

## Project Overview

- **Type**: Embedded C/C++ project for Renesas RA6M5 microcontroller (R7FA6M5BF2CBG)
- **Architecture**: ARM Cortex-M33
- **RTOS Sub-project**: Located in `/RTOS/` directory
- **Build System**: CMake with Ninja
- **Hardware**: Bare-metal embedded (no OS)

---

## Build Commands

### Prerequisites
- ARM GCC Toolchain installed (`arm-none-eabi-gcc`)
- Ninja build system
- Set `ARM_TOOLCHAIN_PATH` environment variable

### Debug Build
```bash
export ARM_TOOLCHAIN_PATH=/usr/sbin
cmake -DCMAKE_TOOLCHAIN_FILE=cmake/gcc.cmake -DCMAKE_BUILD_TYPE=Debug -G Ninja -B build/Debug
cmake --build build/Debug/
```

### Release Build
```bash
cmake -DARM_TOOLCHAIN_PATH="/your/toolchain/path" -DCMAKE_TOOLCHAIN_FILE=cmake/gcc.cmake -DCMAKE_BUILD_TYPE=Release -G Ninja -B build/Release
cmake --build build/Release/
```

### Single File Rebuild
```bash
cmake --build build/Debug/ --target <target_name>
```
To list available targets: `cmake --build build/Debug/ --target help`

### Flash to Device
```bash
rfp-cli -device RA -port /dev/ttyACM0 -auto -file build/Debug/UART.srec -run
```

### Monitor Serial Output
```bash
picocom /dev/ttyUSB0 -b 115200
```

---

## Testing

**No unit tests exist in this project.** This is a bare-metal embedded application.

If tests are added, use Ceedling or Unity test framework. Run tests with: `ceedling test:all` or `ctest`

---

## Linting and Formatting

**No linting or formatting tools are currently configured.** Recommended: clang-format with LLVM style, 4-space indent, 120 char column limit.

---

## Code Style Guidelines

### Naming Conventions

| Element | Convention | Example |
|---------|------------|---------|
| Functions | snake_case | `uart2_callback`, `circlebuf_init` |
| Variables | snake_case | `g_uart2_tx_complete`, `ptDispDev` |
| Types/Structs | PascalCase | `IODev`, `W800Dev`, `circle_buf_t` |
| Enums | PascalCase or UPPER_SNAKE_CASE | `W800_STATE_IDLE` |
| Defines/Macros | UPPER_SNAKE_CASE | `BSP_MULTICORE_PROJECT` |
| Pointers | p/pt prefix | `p_args`, `ptDev` |
| Global variables | g_ prefix | `g_uart2_handle` |

### Code Structure

- **Header guards**: `#ifndef NAME_H` / `#define NAME_H` / `#endif`
- **Braces**: K&R style (opening brace on same line)
- **Indentation**: 4 spaces (no tabs)
- **Line length**: Under 120 characters
- **Comments**: `/* */` for blocks, `//` for lines

### Include Order
1. Configuration header (e.g., `project_config.h`)
2. This module's header (e.g., `drv_uart.h`)
3. Other local headers
4. Third-party headers (FSP, FreeRTOS)
5. C standard library headers
6. C++ standard library headers

### Functions
- Use `_callback` suffix for callback handlers, `_init` for initialization
- Return 0 for success, negative for error
- Keep under 100 lines, put static functions near usage

### Error Handling
```c
int device_init(void) {
    int err = 0;
    err = hal_uart_open(&handle, &config);
    if (err != 0) { return err; }
    return 0;
}
```

### Device Abstraction
```c
typedef struct {
    int (*open)(void *device, void *params);
    int (*close)(void *device);
    int (*read)(void *device, uint8_t *buf, size_t len);
    int (*write)(void *device, const uint8_t *buf, size_t len);
} DeviceOps;
```

### Memory Management
- Avoid `malloc`/`new` - use static buffers
- Use `circle_buf_t` for UART buffering

---

## Project Structure

```
/home/lucky/RA6M5-Project/
├── src/              # Application source code
├── ra/               # Renesas FSP libraries
├── ra_gen/           # RASC-generated code (DO NOT EDIT)
├── ra_cfg/           # FSP configuration
├── cmake/            # CMake build configuration
├── script/           # Linker scripts
├── doc/              # Hardware datasheets
├── .vscode/          # VSCode configuration
└── RTOS/             # FreeRTOS sub-project
```

---

## RTOS Sub-project

```bash
cd RTOS
mkdir -p build
cmake -DCMAKE_TOOLCHAIN_FILE=../cmake/gcc.cmake -DCMAKE_BUILD_TYPE=Debug -G Ninja -B build
cmake --build build/
```

---

## Important Notes

1. **Bare-metal embedded**: No OS, avoid dynamic memory allocation
2. **Hardware-specific**: Code targets specific MCU peripherals
3. **Generated code**: Files in `ra_gen/` are auto-generated - do NOT edit
4. **FSP dependencies**: Uses Renesas Flexible Software Package
5. **Modularity**: Each driver in `src/drv_*.c` should have corresponding header
