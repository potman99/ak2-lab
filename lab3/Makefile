z1: z1.o
	ld z1.o -m elf_i386 -o z1

z1.o: z1.s
	as z1.s --32 -o z1.o -g


all: z1

clean:
	rm z1 *.o