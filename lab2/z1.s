SYSCALL = 0x80
SYSEXIT = 1
STDOUT = 1
SYSREAD = 3
SYSWRITE = 4

.section .data
    firstNr: .long 0xffffffff, 0x701100FF, 0x45100020, 0x08570030, 0x00220026, 0x321000CB, 0x321000CB, 0x04520031, 0x2a7fcf51, 0x1e78103e, 0xdcfdb92c, 0x8e5c3d92, 0x08570030, 0x45100020, 0x08570030, 0xffffffff
    secondNr: .long 0x10304008, 0x701100FF, 0x45100020, 0x08570030, 0x00220026, 0x321000CB, 0x321000CB, 0x04520031, 0x2a7fcf51, 0x1e78103e, 0xdcfdb92c, 0x8e5c3d92, 0x08570030, 0x45100020, 0x08570030, 0x10304008
    numberLenght: .long 0x200
    counter: .int 16

.section .bss
    .lcomm result, 513

.section .text

.global _start
_start:

# esi - loop iterator
xor %esi, %esi

popf
clc
pushf

mainLoop:

movl firstNr(,%esi,4), %eax
addl secondNr(,%esi,4), %eax
pushf

movl %eax, result(,%esi,4)

movl %esi, %ebx
inc %ebx

carryLoop:
popf
jnc carryLoopEnd
# copy main iterator
xor %ecx, %ecx
adc $0, %ch
pushf
mov %ch, result(%ebx)
jmp carryLoop



carryLoopEnd:


inc %esi
cmp numberLenght, %esi
jl mainLoop



movl $SYSEXIT, %eax
int $SYSCALL
