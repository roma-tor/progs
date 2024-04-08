section .data
	scale equ 4
	size equ 5 
	fmt_scan db "%d", 0
	fmt_print db "%d", 10, 0
	
section .bss
	arr resd scale
	
section .text
	extern printf
	extern scanf
	global main
main:
	push rbp
	mov rbp, rsp
	xor r14, r14
	mov r13, -1 ;reg to always num * (-1)
	xor r15, r15
	
scan:
	cmp r14, size
	je end_scan
	
	mov rdi, fmt_scan
	lea rsi, [arr + r14 * scale]
	xor rax, rax
	call scanf
	inc r14
	jmp scan
end_scan:
	cmp r15, size
	je end
	movsx rax, dword[arr + r15 * scale]
	imul r13
	mov dword[arr + r15 * scale], eax
	mov rdi, fmt_print	
	movsx rsi, dword[arr + r15 * scale]
	xor rax, rax
	call printf
	inc r15
	jmp end_scan
	
end:
	leave
	ret
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
