SYSCALL = 0x80
SYSEXIT = 1
STDIN = 0
STDOUT = 1
SYSFORK = 2
READ = 3
SYSWRITE = 4

inputLenght = 100

.section .bss
.lcomm input, inputLenght
.lcomm output, inputLenght


.section .text
.global _start

_start:

# Read input
movl $READ , %eax     
movl $STDIN, %ebx
movl $input, %ecx   
movl $inputLenght, %edx         
int $SYSCALL

# Set iterators
movl $0, %edi
movl $inputLenght, %ebx
dec %ebx

# Start loop
loop:
cmpl %ebx, %edi
jge end


movl input(,%edi,1), %eax

# Check new line char
cmpb $10, %al
je end


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

movl %eax, output(,%edi,1)
inc %edi


jmp loop
end:



movl $SYSWRITE, %eax
movl $STDOUT, %ebx
movl $output, %ecx
movl $inputLenght, %edx
int $SYSCALL


movl $SYSEXIT, %eax
int $SYSCALL