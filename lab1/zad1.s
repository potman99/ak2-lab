# Funkce systemowe

SYSCALL = 0x80
SYSEXIT = 1
STDOUT = 1
SYSREAD = 3
SYSWRITE = 4


.section .data
msg: .ascii "Koha Ma Kota\n"
msgLenght = . -msg

.section .bss
.lcomm reverseMsg, msgLenght

.section .text
.global _start
_start:

#Display msg 
movl $SYSWRITE, %eax
movl $STDOUT, %ebx
movl $msg, %ecx
movl $msgLenght, %edx
int $SYSCALL

# First iterator
movl $msgLenght, %edi
dec %edi

# Second iterator
movl $0, %ecx



#Start loop

loop:
cmpl $0, %edi
jl end

movl msg(,%edi,1), %eax
movl %eax, reverseMsg(,%ecx,1)
dec %edi
inc %ecx

jmp loop
end:






#Display reversed msg 
movl $SYSWRITE, %eax
movl $STDOUT, %ebx
movl $reverseMsg, %ecx
movl $msgLenght, %edx
int $SYSCALL


movl $SYSEXIT, %eax
int $SYSCALL