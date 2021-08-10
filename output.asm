	.file	"sll.c"
	.text
	.p2align 4
	.globl	insert_beginning
	.type	insert_beginning, @function
insert_beginning:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movl	$16, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	malloc@PLT
	movq	(%rbx), %rdx
	movl	%ebp, (%rax)
	movq	%rdx, 8(%rax)
	movq	%rax, (%rbx)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE22:
	.size	insert_beginning, .-insert_beginning
	.p2align 4
	.globl	insert_last
	.type	insert_last, @function
insert_last:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movl	$16, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	malloc@PLT
	movq	(%rbx), %rdx
	movl	%ebp, (%rax)
	movq	$0, 8(%rax)
	testq	%rdx, %rdx
	je	.L10
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%rdx, %rcx
	movq	8(%rdx), %rdx
	testq	%rdx, %rdx
	jne	.L5
	movq	%rax, 8(%rcx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	.cfi_restore_state
	movq	%rax, (%rbx)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	insert_last, .-insert_last
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Out of range"
	.text
	.p2align 4
	.globl	insert_at
	.type	insert_at, @function
insert_at:
.LFB24:
	.cfi_startproc
	testl	%edx, %edx
	jne	.L12
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	(%rdi), %r12
	movq	%rdi, %rbx
	movl	$16, %edi
	testq	%r12, %r12
	jne	.L18
	call	malloc@PLT
	movl	%ebp, (%rax)
	movq	$0, 8(%rax)
	movq	%rax, (%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	leaq	.LC0(%rip), %rdi
	jmp	puts@PLT
	.p2align 4,,10
	.p2align 3
.L18:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
	call	malloc@PLT
	movl	%ebp, (%rax)
	movq	%r12, 8(%rax)
	movq	%rax, (%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	insert_at, .-insert_at
	.section	.rodata.str1.1
.LC1:
	.string	"Linked list empty"
	.text
	.p2align 4
	.globl	delete_beginning
	.type	delete_beginning, @function
delete_beginning:
.LFB25:
	.cfi_startproc
	movq	(%rdi), %r8
	testq	%r8, %r8
	je	.L21
	movq	8(%r8), %rax
	movq	%rax, (%rdi)
	movq	%r8, %rdi
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L21:
	leaq	.LC1(%rip), %rdi
	jmp	puts@PLT
	.cfi_endproc
.LFE25:
	.size	delete_beginning, .-delete_beginning
	.p2align 4
	.globl	delete_end
	.type	delete_end, @function
delete_end:
.LFB26:
	.cfi_startproc
	movq	(%rdi), %r8
	movq	%rdi, %rax
	testq	%r8, %r8
	je	.L29
	movq	8(%r8), %rdi
	testq	%rdi, %rdi
	jne	.L24
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L26:
	movq	%rdi, %r8
	movq	%rax, %rdi
.L24:
	movq	8(%rdi), %rax
	testq	%rax, %rax
	jne	.L26
	movq	8(%rdi), %rax
	testq	%rax, %rax
	je	.L31
	.p2align 4,,10
	.p2align 3
.L27:
	movq	%rdi, %r8
	movq	%rax, %rdi
	movq	8(%rdi), %rax
	testq	%rax, %rax
	jne	.L27
.L31:
	movq	$0, 8(%r8)
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L29:
	leaq	.LC1(%rip), %rdi
	jmp	puts@PLT
	.p2align 4,,10
	.p2align 3
.L30:
	movq	$0, (%rax)
	movq	%r8, %rdi
	jmp	free@PLT
	.cfi_endproc
.LFE26:
	.size	delete_end, .-delete_end
	.p2align 4
	.globl	delete_at
	.type	delete_at, @function
delete_at:
.LFB27:
	.cfi_startproc
	movq	%rdi, %rax
	movq	(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L40
	movq	8(%rdi), %rdx
	testl	%esi, %esi
	je	.L34
	cmpl	$1, %esi
	jg	.L35
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L37:
	subl	$1, %esi
	cmpl	$1, %esi
	je	.L36
.L35:
	movq	8(%rdi), %rdi
	testq	%rdi, %rdi
	jne	.L37
	leaq	.LC0(%rip), %rdi
	jmp	puts@PLT
	.p2align 4,,10
	.p2align 3
.L36:
	movq	8(%rdi), %r8
	movq	8(%r8), %rax
	movq	%rax, 8(%rdi)
	movq	%r8, %rdi
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L34:
	movq	%rdx, (%rax)
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L40:
	leaq	.LC1(%rip), %rdi
	jmp	puts@PLT
	.cfi_endproc
.LFE27:
	.size	delete_at, .-delete_at
	.section	.rodata.str1.1
.LC2:
	.string	"Found in %d\n"
.LC3:
	.string	"Data not found"
	.text
	.p2align 4
	.globl	search
	.type	search, @function
search:
.LFB28:
	.cfi_startproc
	movq	%rdi, %r8
	movl	%esi, %edi
	movq	(%r8), %rcx
	testq	%rcx, %rcx
	je	.L49
	movq	8(%rcx), %rax
	movl	(%rcx), %edx
	xorl	%esi, %esi
	testq	%rax, %rax
	jne	.L43
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L45:
	movq	8(%rax), %rdx
	addl	$1, %esi
	movq	%rax, %rcx
	testq	%rdx, %rdx
	je	.L44
	movq	%rdx, %rax
.L43:
	cmpl	%edi, (%rcx)
	jne	.L45
	leaq	.LC2(%rip), %rdi
	xorl	%eax, %eax
	jmp	printf@PLT
	.p2align 4,,10
	.p2align 3
.L50:
	cmpl	%edx, %edi
	je	.L51
.L44:
	leaq	.LC3(%rip), %rdi
	jmp	puts@PLT
	.p2align 4,,10
	.p2align 3
.L49:
	leaq	.LC1(%rip), %rdi
	jmp	puts@PLT
.L51:
	leaq	.LC2(%rip), %rdi
	jmp	printf@PLT
	.cfi_endproc
.LFE28:
	.size	search, .-search
	.section	.rodata.str1.1
.LC4:
	.string	"%d\n"
	.text
	.p2align 4
	.globl	print_linked
	.type	print_linked, @function
print_linked:
.LFB29:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L60
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	.LC4(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L53:
	movl	(%rbx), %esi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L53
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L60:
	.cfi_restore 3
	.cfi_restore 6
	leaq	.LC1(%rip), %rdi
	jmp	puts@PLT
	.cfi_endproc
.LFE29:
	.size	print_linked, .-print_linked
	.p2align 4
	.globl	free_all
	.type	free_all, @function
free_all:
.LFB30:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L69
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	.p2align 4,,10
	.p2align 3
.L63:
	movq	%rbx, %rdi
	movq	8(%rbx), %rbx
	call	free@PLT
	testq	%rbx, %rbx
	jne	.L63
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L69:
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE30:
	.size	free_all, .-free_all
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB31:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	.LC1(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%r13, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rbp
	movq	$0, (%rsp)
	call	puts@PLT
	movq	%rbp, %rdi
	call	delete_end
	movq	%rbp, %rdi
	call	delete_beginning
	movl	$1, %esi
	movq	%rbp, %rdi
	call	delete_at
	movl	$16, %edi
	call	malloc@PLT
	movq	(%rsp), %rdx
	movl	$99, %esi
	movq	%rbp, %rdi
	movl	$99, (%rax)
	movq	%rdx, 8(%rax)
	movq	%rax, (%rsp)
	call	search
	movq	%rbp, %rdi
	call	delete_end
	movl	$10, %edx
	movl	$20, %esi
	movq	%rbp, %rdi
	call	insert_at
	movl	$16, %edi
	call	malloc@PLT
	movl	$16, %edi
	movq	%rax, %r12
	movl	$12, (%rax)
	movq	(%rsp), %rax
	movq	%rax, 8(%r12)
	call	malloc@PLT
	movl	$16, %edi
	movq	%r12, 8(%rax)
	movq	%rax, %rbx
	leaq	.LC4(%rip), %r12
	movl	$3, (%rax)
	call	malloc@PLT
	movq	%rbp, %rdi
	movl	$19, %esi
	movq	%rbx, 8(%rax)
	movl	$5, (%rax)
	movq	%rax, (%rsp)
	call	insert_last
	movq	%rbp, %rdi
	movl	$2, %edx
	movl	$20, %esi
	call	insert_at
	movq	%rbp, %rdi
	movl	$4, %edx
	movl	$21, %esi
	call	insert_at
	movq	%rbp, %rdi
	xorl	%edx, %edx
	movl	$22, %esi
	call	insert_at
	xorl	%edx, %edx
	movq	%rbp, %rdi
	movl	$23, %esi
	call	insert_at
	movl	$99, %esi
	movq	%rbp, %rdi
	call	search
	movq	%rbp, %rdi
	call	delete_beginning
	movq	%rbp, %rdi
	movl	$4, %esi
	call	delete_at
	movq	%rbp, %rdi
	call	delete_end
	movq	(%rsp), %rbx
	movq	%rbx, %rbp
	testq	%rbx, %rbx
	je	.L83
.L73:
	movl	0(%rbp), %esi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	8(%rbp), %rbp
	testq	%rbp, %rbp
	jne	.L73
.L75:
	movq	%rbx, %rdi
	movq	8(%rbx), %rbx
	call	free@PLT
	testq	%rbx, %rbx
	jne	.L75
.L74:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L84
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L83:
	.cfi_restore_state
	movq	%r13, %rdi
	call	puts@PLT
	jmp	.L74
.L84:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE31:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.1.0"
	.section	.note.GNU-stack,"",@progbits
