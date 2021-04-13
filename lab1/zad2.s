# Funkce systemowe

SYSCALL = 0x80
SYSEXIT = 1
STDOUT = 1
SYSREAD = 3
SYSWRITE = 4


.section .data
msg: .ascii "koHa Ma Kota\n"
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
movl $0, %edi
movl $msgLenght, %ebx
dec %ebx


#Start loop

loop:
cmpl %ebx, %edi
jge end


movl msg(,%edi,1), %eax


cmpb $91, %al
jl uppercaseStart

cmpb $123, %al
jl lowercaseStart

jmp continue

lowercaseStart:
cmpb $97, %al
jge lowercaseEnd
jmp continue

lowercaseEnd:
subl $32, %eax
jmp continue


uppercaseStart:
cmpb $65, %al
jge uppercaseEnd
jmp continue


uppercaseEnd:
addl $32,%eax

continue:

movl %eax, reverseMsg(,%edi,1)
inc %edi


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