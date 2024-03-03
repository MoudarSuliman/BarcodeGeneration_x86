# BarcodeGeneration_x86

## Overview
This project includes a C++ program and an assembly module designed to encode text into a Code 128 barcode and save it as a bitmap image. The `main.cpp` handles file operations and interfaces with the `encode128` assembly function to perform the encoding.

## Prerequisites
- NASM (Netwide Assembler) for assembling the `.asm` file.
- G++ compiler for compiling C++ code. The project is set up for 32-bit compilation.
- Basic understanding of C++ and assembly language.

## Compilation and Execution
The project uses a `makefile` for easy compilation and linking of the assembly and C++ components. To compile and run the project, follow these steps:

1. Ensure NASM and G++ are installed on your system.
2. Open a terminal in the project directory.
3. Run the command `make` to compile and link the program. This creates the executable `test`.
4. Run the executable using `./test`.

## Files
- `main.cpp`: Main program file in C++.
- `encode128.asm`: Assembly code for encoding text into a Code 128 barcode.
- `makefile`: Contains commands for compiling and linking the project.

## Cleaning Up
To remove all generated files, run `make clean`. This command cleans up the directory by removing object files, the executable, and other generated files.

## Customization
You can modify the `main.cpp` file to change the output file name or adjust the barcode encoding parameters. The assembly code (`encode128.asm`) can be edited for deeper customization of the barcode encoding process.
