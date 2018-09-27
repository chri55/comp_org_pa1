	.file	"calc.c"
	.text
	.globl	getNumAndBase
	.type	getNumAndBase, @function
getNumAndBase:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movb	$32, -29(%rbp)
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$45, %al
	jne	.L2
	movq	-40(%rbp), %rax
	movzbl	1(%rax), %eax
	movb	%al, -29(%rbp)
	movl	$2, -28(%rbp)
	jmp	.L3
.L4:
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	movl	-28(%rbp), %eax
	movslq	%eax, %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -28(%rbp)
.L3:
	movl	-28(%rbp), %eax
	movslq	%eax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	subq	$1, %rax
	cmpq	%rax, %rbx
	jbe	.L4
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	leaq	-1(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movzbl	-29(%rbp), %eax
	jmp	.L5
.L2:
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -29(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	subl	$1, %eax
	movl	%eax, -20(%rbp)
	movl	$0, -24(%rbp)
	jmp	.L6
.L7:
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	movl	-24(%rbp), %eax
	cltq
	leaq	1(%rax), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -24(%rbp)
.L6:
	movl	-24(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L7
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movzbl	-29(%rbp), %eax
.L5:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	getNumAndBase, .-getNumAndBase
	.globl	checkInput
	.type	checkInput, @function
checkInput:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	cmpb	$100, -4(%rbp)
	je	.L9
	cmpb	$111, -4(%rbp)
	je	.L9
	cmpb	$98, -4(%rbp)
	je	.L9
	cmpb	$120, -4(%rbp)
	jne	.L10
.L9:
	movl	$1, %eax
	jmp	.L11
.L10:
	movl	$0, %eax
.L11:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	checkInput, .-checkInput
	.globl	val
	.type	val, @function
val:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	cmpb	$47, -4(%rbp)
	jle	.L13
	cmpb	$57, -4(%rbp)
	jg	.L13
	movsbl	-4(%rbp), %eax
	subl	$48, %eax
	jmp	.L14
.L13:
	movsbl	-4(%rbp), %eax
	subl	$55, %eax
.L14:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	val, .-val
	.globl	stringToTwos
	.type	stringToTwos, @function
stringToTwos:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -32(%rbp)
	movl	%esi, %eax
	movb	%al, -36(%rbp)
	movq	$0, -16(%rbp)
	movl	$1, -24(%rbp)
	movsbl	-36(%rbp), %eax
	cmpl	$111, %eax
	je	.L17
	cmpl	$120, %eax
	je	.L18
	cmpl	$98, %eax
	jne	.L16
	movl	$1, -24(%rbp)
	jmp	.L16
.L17:
	movl	$3, -24(%rbp)
	jmp	.L16
.L18:
	movl	$4, -24(%rbp)
	nop
.L16:
	movl	$0, -20(%rbp)
	jmp	.L20
.L21:
	movl	-24(%rbp), %eax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rbx
	movl	%eax, %ecx
	salq	%cl, %rbx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	val
	cltq
	addq	%rbx, %rax
	movq	%rax, -16(%rbp)
	addl	$1, -20(%rbp)
.L20:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L21
	movq	-16(%rbp), %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	stringToTwos, .-stringToTwos
	.globl	decimalToTwos
	.type	decimalToTwos, @function
decimalToTwos:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	subl	$1, %eax
	movl	%eax, -20(%rbp)
	movq	$1, -16(%rbp)
	movl	$0, -32(%rbp)
	jmp	.L24
.L25:
	movq	-16(%rbp), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, -16(%rbp)
	addl	$1, -32(%rbp)
.L24:
	movl	-20(%rbp), %eax
	subl	$1, %eax
	cmpl	-32(%rbp), %eax
	jge	.L25
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$45, %al
	jne	.L26
	movq	-16(%rbp), %rcx
	movabsq	$7378697629483820647, %rdx
	movq	%rcx, %rax
	imulq	%rdx
	sarq	$2, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -16(%rbp)
.L26:
	movl	$1, -28(%rbp)
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$45, %al
	jne	.L27
	movl	$-1, -28(%rbp)
.L27:
	movq	$0, -8(%rbp)
	movl	$0, -24(%rbp)
	jmp	.L28
.L30:
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$45, %al
	je	.L29
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	val
	cltq
	imulq	-16(%rbp), %rax
	addq	%rax, -8(%rbp)
	movq	-16(%rbp), %rcx
	movabsq	$7378697629483820647, %rdx
	movq	%rcx, %rax
	imulq	%rdx
	sarq	$2, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -16(%rbp)
.L29:
	addl	$1, -24(%rbp)
.L28:
	movl	-24(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jle	.L30
	movl	-28(%rbp), %eax
	cltq
	movq	-8(%rbp), %rdx
	imulq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	decimalToTwos, .-decimalToTwos
	.section	.rodata
.LC0:
	.string	"01"
.LC1:
	.string	"01234567"
.LC2:
	.string	"0123456789ABCDEF"
	.text
	.globl	twosToString
	.type	twosToString, @function
twosToString:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, %eax
	movb	%al, -60(%rbp)
	movl	$65, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	movl	$0, -24(%rbp)
	movq	-8(%rbp), %rax
	addq	$64, %rax
	movb	$0, (%rax)
	movl	$0, -36(%rbp)
	movq	$.LC0, -16(%rbp)
	movl	$1, -32(%rbp)
	movl	$63, -20(%rbp)
	movsbl	-60(%rbp), %eax
	cmpl	$111, %eax
	je	.L34
	cmpl	$120, %eax
	je	.L35
	cmpl	$98, %eax
	jne	.L33
	movl	$1, -36(%rbp)
	movq	$.LC0, -16(%rbp)
	movl	$1, -32(%rbp)
	jmp	.L33
.L34:
	movl	$7, -36(%rbp)
	movq	$.LC1, -16(%rbp)
	movl	$3, -32(%rbp)
	jmp	.L33
.L35:
	movl	$15, -36(%rbp)
	movq	$.LC2, -16(%rbp)
	movl	$4, -32(%rbp)
	nop
.L33:
	movl	-20(%rbp), %eax
	movl	%eax, -28(%rbp)
	jmp	.L37
.L38:
	movq	-56(%rbp), %rax
	andl	-36(%rbp), %eax
	movl	%eax, -24(%rbp)
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movl	-24(%rbp), %eax
	movslq	%eax, %rcx
	movq	-16(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movl	-32(%rbp), %eax
	movl	%eax, %ecx
	sarq	%cl, -56(%rbp)
	subl	$1, -28(%rbp)
.L37:
	cmpl	$0, -28(%rbp)
	jns	.L38
	movq	-8(%rbp), %rax
	addq	$64, %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	twosToString, .-twosToString
	.section	.rodata
.LC3:
	.string	"\033[31m"
	.align 8
.LC4:
	.string	"%sERROR 1: Bogus Input. One or more identifiers is incorrect. Valid identifiers are 'b', 'o', 'd', 'x'.\n\n"
.LC5:
	.string	"%lli\n"
	.align 8
.LC6:
	.string	"%sERROR 2: Bogus Input. Use '+' or '-' as operator.\n\n"
.LC7:
	.string	"%lli"
.LC8:
	.string	"%c%s\n\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	movb	%al, -64(%rbp)
	movq	-80(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-80(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-80(%rbp), %rax
	addq	$32, %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	movb	%al, -63(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	getNumAndBase
	movb	%al, -62(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	getNumAndBase
	movb	%al, -61(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movl	$65, %edi
	call	malloc
	movq	%rax, -24(%rbp)
	movsbl	-62(%rbp), %eax
	movl	%eax, %edi
	call	checkInput
	movl	%eax, -60(%rbp)
	movsbl	-61(%rbp), %eax
	movl	%eax, %edi
	call	checkInput
	movl	%eax, -56(%rbp)
	movsbl	-63(%rbp), %eax
	movl	%eax, %edi
	call	checkInput
	movl	%eax, -52(%rbp)
	movl	-60(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jne	.L41
	movl	-60(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jne	.L41
	movl	-56(%rbp), %eax
	cmpl	-52(%rbp), %eax
	je	.L42
.L41:
	movq	stderr(%rip), %rax
	movl	$.LC3, %edx
	movl	$.LC4, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$0, %edi
	call	exit
.L42:
	cmpb	$100, -62(%rbp)
	jne	.L43
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	decimalToTwos
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	jmp	.L44
.L43:
	movsbl	-62(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	stringToTwos
	movq	%rax, -48(%rbp)
.L44:
	cmpb	$100, -61(%rbp)
	jne	.L45
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	decimalToTwos
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	jmp	.L46
.L45:
	movsbl	-61(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	stringToTwos
	movq	%rax, -40(%rbp)
.L46:
	cmpb	$43, -64(%rbp)
	jne	.L47
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -32(%rbp)
	jmp	.L48
.L47:
	cmpb	$45, -64(%rbp)
	jne	.L49
	movq	-48(%rbp), %rax
	subq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	jmp	.L48
.L49:
	movq	stderr(%rip), %rax
	movl	$.LC3, %edx
	movl	$.LC6, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$0, %edi
	call	exit
.L48:
	cmpb	$100, -63(%rbp)
	jne	.L50
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movl	$.LC7, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	jmp	.L51
.L50:
	movsbl	-63(%rbp), %edx
	movq	-32(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	twosToString
	movq	%rax, -24(%rbp)
.L51:
	movsbl	-63(%rbp), %eax
	movq	-24(%rbp), %rdx
	movl	%eax, %esi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	printf
	movl	$10, %edi
	call	putchar
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
