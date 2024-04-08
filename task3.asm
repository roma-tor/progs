section .data
	scale equ 4
	size equ 5
	fmt_scan db "%d", 0
	fmt_print db "%d ", 0
	fmt_end db "", 10, 0
section .bss
	arr resd scale
	
section .text
	extern printf
	extern scanf
	global main
	
main:
	push rbp
	mov rbp, rsp
	xor r15, r15
	mov r14, -1
	
scan:
	cmp r15, size 
	je print
	
	mov rdi, fmt_scan
	lea rsi, [arr + r15 * scale]
	xor rax, rax
	call scanf
	
	inc r15
	jmp scan
	
print:
	inc r14
	cmp r14, size
	je end 

	movsx rsi, dword[arr + r14 * scale]
	cmp rsi, 0
	jl print
 
	mov rdi, fmt_print
	xor rax, rax
	call printf
	jmp print

end:

	mov rdi, fmt_end
	xor rax, rax
	call printf

	leave 	
	ret
	
	
	
	
	
