zad1: zad1.o
	ld zad1.o -m elf_i386 -o zad1

zad1.o: zad1.s
	as zad1.s --32 -o zad1.o -g

zad2: zad2.o
	ld zad2.o -m elf_i386 -o zad2

zad2.o: zad2.s
	as zad2.s --32 -o zad2.o -g

zad3: zad3.o
	ld zad3.o -m elf_i386 -o zad3

zad3.o: zad3.s
	as zad3.s --32 -o zad3.o -g

all: zad1 zad2 zad3

clean: 
	rm zad1 zad2 zad3 *.o
