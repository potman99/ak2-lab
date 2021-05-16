.global GetTime
.type GetTime, @function


GetTime:

push %ebx

xor %edx, %edx
xor %eax, %eax
cpuid
rdtsc
pop %ebx

ret
