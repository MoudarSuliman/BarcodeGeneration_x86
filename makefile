CC=g++
ASMBIN=nasm

all : asm cc link
asm : 
	$(ASMBIN) -o encode128.o -f elf -g -l encode128.lst encode128.asm
cc :
	$(CC) -m32 -c -g -O0 main.cpp &> errors.txt
link :
	$(CC) -m32 -g -o test main.o encode128.o
clean :
	rm *.o
	rm test
	rm errors.txt	
	rm encode128.lst
