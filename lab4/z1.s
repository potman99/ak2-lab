	.file	"z1.c"
	.text
	.section	.rodata
.LC0:
	.string	"Diffrence row: %llu\n"
.LC1:
	.string	"Diffrence col: %llu\n"
.LC2:
	.string	"%c\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1048672, %rsp
	movl	%edi, -1048660(%rbp)
	movq	%rsi, -1048672(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -1048648(%rbp)
	jmp	.L2
.L5:
	movl	$0, -1048644(%rbp)
	jmp	.L3
.L4:
	movl	-1048644(%rbp), %eax
	movl	%eax, %ecx
	movl	-1048644(%rbp), %eax
	cltq
	movl	-1048648(%rbp), %edx
	movslq	%edx, %rdx
	salq	$10, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$1048592, %rax
	movb	%cl, (%rax)
	addl	$1, -1048644(%rbp)
.L3:
	cmpl	$1023, -1048644(%rbp)
	jle	.L4
	addl	$1, -1048648(%rbp)
.L2:
	cmpl	$1023, -1048648(%rbp)
	jle	.L5
	movl	$0, %eax
	call	GetTime@PLT
	movq	%rax, -1048624(%rbp)
	movl	$0, -1048640(%rbp)
	jmp	.L6
.L9:
	movl	$0, -1048636(%rbp)
	jmp	.L7
.L8:
	movl	-1048636(%rbp), %eax
	cltq
	movl	-1048640(%rbp), %edx
	movslq	%edx, %rdx
	salq	$10, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$1048592, %rax
	movzbl	(%rax), %eax
	movb	%al, -1048649(%rbp)
	addl	$1, -1048636(%rbp)
.L7:
	cmpl	$1023, -1048636(%rbp)
	jle	.L8
	addl	$1, -1048640(%rbp)
.L6:
	cmpl	$1023, -1048640(%rbp)
	jle	.L9
	movl	$0, %eax
	call	GetTime@PLT
	movq	%rax, -1048616(%rbp)
	movq	-1048616(%rbp), %rax
	subq	-1048624(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	call	GetTime@PLT
	movq	%rax, -1048608(%rbp)
	movl	$0, -1048632(%rbp)
	jmp	.L10
.L13:
	movl	$0, -1048628(%rbp)
	jmp	.L11
.L12:
	movl	-1048632(%rbp), %eax
	cltq
	movl	-1048628(%rbp), %edx
	movslq	%edx, %rdx
	salq	$10, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$1048592, %rax
	movzbl	(%rax), %eax
	movb	%al, -1048649(%rbp)
	addl	$1, -1048628(%rbp)
.L11:
	cmpl	$1023, -1048628(%rbp)
	jle	.L12
	addl	$1, -1048632(%rbp)
.L10:
	cmpl	$1023, -1048632(%rbp)
	jle	.L13
	movl	$0, %eax
	call	GetTime@PLT
	movq	%rax, -1048600(%rbp)
	movq	-1048600(%rbp), %rax
	subq	-1048608(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movsbl	-1048649(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
