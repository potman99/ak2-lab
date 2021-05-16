SYSCALL = 0x80
SYSEXIT = 1
STDOUT = 1
SYSREAD = 3
SYSWRITE = 4

.section .data
    firstNr: .long 0x00000001,0xffffffff, 0x701100FF, 0xffffffff, 0x08570030, 0x00220026, 0x321000CB, 0x321000CB, 0x04520031, 0x2a7fcf51, 0x1e78103e, 0xdcfdb92c, 0x8e5c3d92, 0x08570030, 0x45100020, 0x08570030, 0xffffffff
    secondNr: .long 0x00000001, 0xffffffff, 0x45100020, 0x08570030, 0x00220026, 0x321000CB, 0x321000CB, 0x04520031, 0x2a7fcf51, 0x1e78103e, 0xdcfdb92c, 0x8e5c3d92, 0x08570030, 0x45100020, 0x08570030, 0x10304008
    counter: .int 16
    display_string: .ascii "%d-"

.section .bss
    .lcomm result, 513

.section .text

.global _start
_start:

# esi - loop iterator
xor %esi, %esi



mainLoop:

popf
clc
pushf

movl firstNr(,%esi,4), %eax
addl secondNr(,%esi,4), %eax
pushf


addl %eax, result(,%esi,4)



movl %esi, %ebx
inc %ebx

carryLoop:
popf
jnc carryLoopEnd
# copy main iterator
adcl $0 ,result(,%ebx,4)
pushf

movl result(,%ebx,4), %eax
jmp carryLoop



carryLoopEnd:


inc %esi
cmp counter, %esi
jl mainLoop



movl $SYSEXIT, %eax
int $SYSCALL
