.global AddNumbers
.type AddNumbers, @function

.section .data
    firstNr: .long 0x00000001,0xffffffff, 0x701100FF, 0xffffffff, 0x08570030, 0x00220026, 0x321000CB, 0x321000CB, 0x04520031, 0x2a7fcf51, 0x1e78103e, 0xdcfdb92c, 0x8e5c3d92, 0x08570030, 0x45100020, 0x08570030, 0xffffffff
    secondNr: .long 0x00000001, 0xffffffff, 0x45100020, 0x08570030, 0x00220026, 0x321000CB, 0x321000CB, 0x04520031, 0x2a7fcf51, 0x1e78103e, 0xdcfdb92c, 0x8e5c3d92, 0x08570030, 0x45100020, 0x08570030, 0x10304008
    counter: .int 16
    display_string: .ascii "%d  "

    .lcomm result, 544

AddNumbers:

push %ebx

xor %esi, %esi

mainLoop:

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


xor %ebx, %ebx


displayLoop:

movl result(,%ebx,4), %eax
pushl %eax
pushl $display_string
call printf
add $8, %esp

inc %ebx
cmp $17, %ebx
jl displayLoop


pop %ebx

ret