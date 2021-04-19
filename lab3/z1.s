SYSCALL = 0x80
SYSEXIT = 1
STDOUT = 1
SYSREAD = 3
SYSWRITE = 4

.section .data
    firstNr: .long 0x00000001,0xffffffff, 0x701100FF, 0xffffffff, 0x08570030, 0x00220026, 0x321000CB, 0x321000CB, 0x04520031, 0x2a7fcf51, 0x1e78103e, 0xdcfdb92c, 0x8e5c3d92, 0x08570030, 0x45100020, 0x08570030, 0xffffffff
    secondNr: .long 0x00000001, 0xffffffff, 0x45100020, 0x08570030, 0x00220026, 0x321000CB, 0x321000CB, 0x04520031, 0x2a7fcf51, 0x1e78103e, 0xdcfdb92c, 0x8e5c3d92, 0x08570030, 0x45100020, 0x08570030, 0x10304008
    counter: .int 16
    format_out: .asciz "Cycles number: %d%d \n"
    msg: .asciz "Waiting\n"
    

.section .bss
    .lcomm result, 513
    .lcomm startTime, 64
    .lcomm stopTime, 64

.section .text

.global main
main:

cpuid

rdtsc
xor %esi, %esi


pushl %eax
pushl %edx
pushl $format_out
call printf

add $12, %esp




ret